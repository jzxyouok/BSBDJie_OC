//
//  BSFriendTrendsViewController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSFriendTrendsViewController.h"
#import "BSRecommendViewController.h"
#import "BSLoginOrRegisterViewController.h"

@interface BSFriendTrendsViewController ()

@end

@implementation BSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏标题
    self.navigationItem.title = @"我的关注";
    
    //导航栏leftItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    //背景
    self.view.backgroundColor = BSGlobalBg;
}

#pragma mark - 登陆或注册
- (IBAction)LoginOrRegisterClick {
    BSLoginOrRegisterViewController *loginOrRegisterVC = [[BSLoginOrRegisterViewController alloc] init];
    [self presentViewController:loginOrRegisterVC animated:YES completion:NULL];
}

- (void)friendsClick {
    BSRecommendViewController *recommendVC = [[BSRecommendViewController alloc] init];
    [self.navigationController pushViewController:recommendVC animated:YES];
}



@end
