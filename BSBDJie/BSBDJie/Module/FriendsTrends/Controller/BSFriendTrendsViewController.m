//
//  BSFriendTrendsViewController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSFriendTrendsViewController.h"

@interface BSFriendTrendsViewController ()

@end

@implementation BSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏标题
    self.navigationItem.title = @"我的关注";
    
    //导航栏leftItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
}

- (void)friendsClick {
    NSLog(@"friends");
}

@end
