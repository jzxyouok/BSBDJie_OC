//
//  BSUserCell.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/15.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSUserCell.h"
#import "BSUser.h"
#import <UIImageView+WebCache.h>

@interface BSUserCell()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation BSUserCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setUser:(BSUser *)user {
    _user = user;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zd关注",user.fans_count];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
