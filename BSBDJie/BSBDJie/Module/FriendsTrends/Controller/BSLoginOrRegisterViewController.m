//
//  BSLoginOrRegisterViewController.m
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/21.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

#import "BSLoginOrRegisterViewController.h"

@interface BSLoginOrRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginConstraint;

@end

@implementation BSLoginOrRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //小bug
    [self.view insertSubview:self.bgView atIndex:0];
}

#pragma mark - 登陆注册切换
- (IBAction)changeClick:(UIButton *)sender {
    
    //取消键盘响应
    [self.view endEditing:YES];
    
    if (self.loginConstraint.constant == 0) {//去注册
        self.loginConstraint.constant = -self.view.width;
        sender.selected = YES;
    } else { //去登陆
        self.loginConstraint.constant = 0;
        sender.selected = NO;
    }
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - 返回上一页面
- (IBAction)back {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - 取消键盘响应
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
