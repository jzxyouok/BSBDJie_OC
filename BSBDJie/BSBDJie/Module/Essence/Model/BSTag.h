//
//  BSTag.h
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/18.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSTag : NSObject

/**
 *  头像
 */
@property (nonatomic,copy) NSString *image_list;

/**
 *  主题
 */
@property (nonatomic,copy) NSString *theme_name;

/**
 *  订阅数
 */
@property (nonatomic,assign) NSInteger sub_number;


@end
