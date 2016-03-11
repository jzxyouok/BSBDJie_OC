//
//  UIBarButtonItem+BSExtension.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/11.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "UIBarButtonItem+BSExtension.h"

@implementation UIBarButtonItem (BSExtension)

+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[self alloc] initWithCustomView:button];
}

@end
