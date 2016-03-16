//
//  BSRecommendViewController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/14.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSRecommendViewController.h"
#import "BSCategoryCell.h"
#import "BSCategory.h"
#import "BSUser.h"
#import "BSUserCell.h"
#import <MJExtension.h>

#define selectedCatogory self.categories[self.categoryTab.indexPathForSelectedRow.row]

static NSString *const BSCategoryCellId = @"BSCategory";
static NSString *const BSUserCellId = @"BSUser";

@interface BSRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>

/**
 *  网络manager
 */
@property (nonatomic,strong) AFHTTPSessionManager *manager;

/**
 *  左边类别数组
 */
@property (nonatomic,strong) NSArray *categories;

/**
 *  左边类别表格
 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTab;

/**
 *  右边内容表格
 */
@property (weak, nonatomic) IBOutlet UITableView *userTab;

@end

@implementation BSRecommendViewController

#pragma mark - 控制器销毁，取消所有网络请求
- (void)dealloc {
    [self.manager.operationQueue cancelAllOperations];
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化tab
    [self setupTab];
    
    //导航栏主题
    self.navigationItem.title = @"推荐关注";
    
    //初始化刷新控件
    [self setupFresh];
    
    //加载左边类别数据
    [self loadCategories];
}

#pragma mark - 初始化刷新控件
- (void)setupFresh {
    self.userTab.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUser)];
    self.userTab.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
}

#pragma mark - 加载左边类别数据
- (void)loadCategories
{
    //loading框
    [SVProgressHUD show];
    
    //发送网络请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //解析数据
        self.categories = [BSCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新数据
        [self.categoryTab reloadData];
        
        //默认选中
        [self.categoryTab selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //默认刷新用户数据
        [self.userTab.header beginRefreshing];
        
        //隐藏loading框
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        //显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
}

#pragma mark -加载右边用户数据
- (void)loadNewUser {
    BSCategory *categoty =  selectedCatogory;
    
    categoty.currentPage = 1;
    
    //发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(categoty.id);
    params[@"page"] = @(categoty.currentPage);
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //解析数据
        NSArray *users = [BSUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [categoty.users removeAllObjects];
        [categoty.users addObjectsFromArray:users];
        
        categoty.total = [responseObject[@"total"] integerValue];
        
        //刷新数据
        [self.userTab reloadData];
        
        //结束顶部刷新
        [self.userTab.header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        //提示
        [SVProgressHUD showErrorWithStatus:@"加载关注信息失败！"];
        
        //结束顶部刷新
        [self.userTab.header endRefreshing];
    }];
}

- (void)loadMoreUsers {
    //发送请求
    BSCategory *category = selectedCatogory;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(++category.currentPage);
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //解析数据
        NSArray *users = [BSUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [category.users addObjectsFromArray:users];
        
        //刷新数据
        [self.userTab reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 初始化tab
- (void)setupTab {
    //注册cell
    [self.categoryTab registerNib:[UINib nibWithNibName:NSStringFromClass([BSCategoryCell class]) bundle:nil] forCellReuseIdentifier:BSCategoryCellId];
    [self.userTab registerNib:[UINib nibWithNibName:NSStringFromClass([BSUserCell class]) bundle:nil] forCellReuseIdentifier:BSUserCellId];
    self.userTab.rowHeight = 70;
    self.userTab.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}

#pragma mark - 检查刷新控件状态
- (void)checkFooterState {
    BSCategory *categoty = selectedCatogory;
    if (categoty.users.count == categoty.total) {
        [self.userTab.footer noticeNoMoreData];
    } else {
        [self.userTab.footer endRefreshing];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.categoryTab) {
        return self.categories.count;
    } else {
        //检查刷新控件状态
        [self checkFooterState];
        
        BSCategory *categoty = selectedCatogory;
        return categoty.users.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryTab) {
        BSCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:BSCategoryCellId];
        cell.category = self.categories[indexPath.row];
        return cell;
    } else {
        BSUserCell *cell = [tableView dequeueReusableCellWithIdentifier:BSUserCellId];
        BSCategory *category = selectedCatogory;
        if (indexPath.row < category.users.count) {
            cell.user = category.users[indexPath.row];
        }
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.categoryTab) {
        //加载数据
        [self.userTab.header beginRefreshing];
    }
}

@end
