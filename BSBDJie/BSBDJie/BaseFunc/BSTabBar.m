//
//  BSTabBar.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSTabBar.h"

@interface BSTabBar()

@property (nonatomic,weak) UIButton *publishButton;

@end

@implementation BSTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publishButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
        publishButton.bounds = CGRectMake(0, 0, 30, 30);
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置发布按钮的frame
    CGFloat publishButtonwidth = self.publishButton.currentBackgroundImage.size.width;
    CGFloat publishButtonheight = self.publishButton.currentBackgroundImage.size.height;
    self.publishButton.center = CGPointMake(self.width/2, self.height/2);
    self.publishButton.bounds = CGRectMake(0, 0, publishButtonwidth, publishButtonheight);
    
    
    //设置其他UITabBarButton的frame
    CGFloat buttonW = self.width/5;
    CGFloat buttonH = self.height;
    
    NSUInteger index = 0;
    for (UIView *button in self.subviews) {
        if (![button isMemberOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        CGFloat buttonX = buttonW * ((index>1)?(index+1):index);
        button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
        index++;
    }
}

@end
