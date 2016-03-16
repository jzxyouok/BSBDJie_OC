//
//  BSCategory.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/15.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSCategory.h"

@implementation BSCategory

- (void)dealloc {
    _name = nil;
    _users = nil;
}

- (NSMutableArray *)users {
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
