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
#import <MJExtension.h>

static NSString *const BSCategoryCellId = @"BSCategoryCellId";

@interface BSRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>

/**
 *  左边类别数组
 */
@property (nonatomic,strong) NSArray *categories;

/**
 *  左边类别表格
 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTab;

@end

@implementation BSRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //注册cell
    [self.categoryTab registerNib:[UINib nibWithNibName:NSStringFromClass([BSCategoryCell class]) bundle:nil] forCellReuseIdentifier:BSCategoryCellId];
    
    //导航栏主题
    self.navigationItem.title = @"推荐关注";
    
    //loading框
    [SVProgressHUD show];
    
    //发送网络请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //解析数据
        self.categories = [BSCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新数据
        [self.categoryTab reloadData];
        
        //默认选中
        [self.categoryTab selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //隐藏loading框
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (BSCategoryCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BSCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:BSCategoryCellId];
    
    cell.category = self.categories[indexPath.row];
    
    return cell;
}

@end
