//
//  UIBarButtonItem+BSExtension.h
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/11.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BSExtension)

/**
 *  初始化item
 *
 *  @param image
 *  @param highlightImage
 *  @param target
 *  @param action
 *
 *  @return 
 */
+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

@end
