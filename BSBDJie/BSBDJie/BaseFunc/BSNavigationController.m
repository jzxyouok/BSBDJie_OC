//
//  BSNavigationController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/11.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSNavigationController.h"

@interface BSNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BSNavigationController

+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  处理【自定义返回按钮或者隐藏navigationBar时 系统返回手势会失效！！！】问题
     */
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.backgroundColor = [UIColor greenColor];
        button.size = CGSizeMake(70, 30);
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        
//        [button sizeToFit];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backClick {
    [self popViewControllerAnimated:YES];
}

@end
