//
//  NoticeViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController ()

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_LightGray;
    
    [self configNavigationBar];
}

- (void)configNavigationBar {
    self.title = @"消息";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftBarBtnAction:) image:[UIImage imageNamed:@"login_back"]];
}

#pragma mark - Button Action
- (void)leftBarBtnAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
