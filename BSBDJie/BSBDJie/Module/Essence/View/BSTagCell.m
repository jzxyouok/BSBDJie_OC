//
//  BSTagCell.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/18.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSTagCell.h"
#import "BSTag.h"
#import <UIImageView+WebCache.h>

@interface BSTagCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumLabel;

@end

@implementation BSTagCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setRecommendTag:(BSTag *)recommendTag {
    _recommendTag = recommendTag;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = recommendTag.theme_name;
    NSString *subNum = nil;
    if (recommendTag.sub_number < 10000) {
        subNum = [NSString stringWithFormat:@"%zd人关注", recommendTag.sub_number];
    } else {
        subNum = [NSString stringWithFormat:@"%.1f万人关注", recommendTag.sub_number/10000.0];
    }
    self.subNumLabel.text = subNum;
}

- (void)setFrame:(CGRect)frame {
    
    //拦截frame！！！
    frame.origin.x = 10;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 5;
    
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
