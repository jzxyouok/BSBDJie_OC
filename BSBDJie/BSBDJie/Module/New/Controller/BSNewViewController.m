//
//  BSNewViewController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSNewViewController.h"

@interface BSNewViewController ()

@end

@implementation BSNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //导航栏leftItem
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" target:self action:@selector(newClick)];
}

- (void)newClick {
    NSLog(@"new");
}

@end
