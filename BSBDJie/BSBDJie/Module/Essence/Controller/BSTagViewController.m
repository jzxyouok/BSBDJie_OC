//
//  BSTagViewController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/18.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSTagViewController.h"
#import "BSTag.h"
#import "BSTagCell.h"
#import <MJExtension.h>

static NSString *const tagCellId = @"tagCell";

@interface BSTagViewController ()<UITableViewDataSource, UITableViewDelegate>

/**
 *  列表
 */
@property (weak, nonatomic) IBOutlet UITableView *tagTab;

/**
 *  数组
 */
@property (nonatomic,strong) NSArray *tags;

/**
 *  网络请求
 */
@property (nonatomic,copy) AFHTTPSessionManager *manager;

@end

@implementation BSTagViewController

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
    
    //加载数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tags_list";
    params[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //解析数据
        self.tags = [BSTag objectArrayWithKeyValuesArray:responseObject[@"rec_tags"]];
        
        //刷新列表
        [self.tagTab reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 初始化tab
- (void)setupTab {
    [self.tagTab registerNib:[UINib nibWithNibName:NSStringFromClass([BSTagCell class]) bundle:nil] forCellReuseIdentifier:tagCellId];
    self.tagTab.rowHeight = 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BSTagCell *cell = [tableView dequeueReusableCellWithIdentifier:tagCellId];
    cell.recommendTag = self.tags[indexPath.row];
    return cell;
}

@end
