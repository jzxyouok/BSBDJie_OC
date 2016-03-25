//
//  BSGuideView.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/25.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSGuideView.h"

static NSString *const key = @"CFBundleShortVersionString";

@implementation BSGuideView

+ (void)show {
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (![currentVersion isEqualToString:oldVersion]) {
        //加载引导页
        BSGuideView *guideView = [BSGuideView guideView];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        guideView.frame = window.frame;
        [window addSubview:guideView];
        
        //存储版本号
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (instancetype)guideView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (IBAction)buttonClick {
    [self removeFromSuperview];
}

@end
