//
//  BSCategory.h
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/15.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSCategory : NSObject

/**
 *  id
 */
@property (nonatomic,assign) NSInteger id;

/**
 *  类别总数
 */
@property (nonatomic,assign) NSInteger total;

/**
 *  类别名称
 */
@property (nonatomic,copy) NSString *name;

@end
