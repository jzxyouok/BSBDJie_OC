//
//  BSTextField.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/21.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSTextField.h"
#import <objc/runtime.h>

static NSString * const BSPlaceholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation BSTextField

+ (void)initialize {
    
    unsigned int count = 0;
    //拷贝出所有成员变量列表
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i++) {
        //取出属性
        Ivar ivar = ivars[i];
        
        BSLog(@"%s", ivar_getName(ivar));
    }
    free(ivars);
}

- (void)awakeFromNib {
   
    //取消系统默认效果
    self.tintColor = [UIColor whiteColor];
    
    //取消第一响应
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
   
    /**
     *  runtime
     */
    [self setValue:[UIColor whiteColor] forKeyPath:BSPlaceholderColorKeyPath];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self setValue:[UIColor grayColor] forKeyPath:BSPlaceholderColorKeyPath];
    return [super resignFirstResponder];
}

@end
