//
//  BSVerticalButton.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/21.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSVerticalButton.h"

@implementation BSVerticalButton

- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //调整image
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    
    //调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

@end
