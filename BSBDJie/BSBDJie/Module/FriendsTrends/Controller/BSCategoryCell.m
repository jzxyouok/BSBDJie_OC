//
//  BSCategoryCell.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/15.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSCategoryCell.h"
#import "BSCategory.h"

@interface BSCategoryCell()
/**
 *  左边指示器
 */
@property (weak, nonatomic) IBOutlet UIView *categoryIndicator;

@end

@implementation BSCategoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setCategory:(BSCategory *)category {
    _category = category;
    self.textLabel.text = category.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    //指示器
    self.categoryIndicator.hidden = !selected;
    
    //文字颜色
    self.textLabel.textColor = selected ? [UIColor redColor] : [UIColor lightGrayColor];
}

@end
