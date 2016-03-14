//
//  BSRecommendViewController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/14.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSRecommendViewController.h"

@interface BSRecommendViewController ()

@end

@implementation BSRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏主题
    self.navigationItem.title = @"推荐关注";
    
    //loading框
    [SVProgressHUD show];
    
    //发送网络请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        BSLog(@"response = %@",responseObject);
        
        //隐藏loading框
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}


@end
