//
//  BSUser.h
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/15.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSUser : NSObject
/**
 *  头像
 */
@property (nonatomic,copy) NSString *header;
/**
 *  昵称
 */
@property (nonatomic,copy) NSString *screen_name;
/**
 *  粉丝数
 */
@property (nonatomic,assign) NSInteger fans_count;

@end
