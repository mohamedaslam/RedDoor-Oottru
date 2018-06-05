//
//  MineViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "MineViewController.h"
#import "SettingViewController.h"
#import "NoticeViewController.h"
#import "PersonalInfoViewController.h"

#define ColorOfHeaderBgView_LightRed    ITHexColor(@"#f77069",1)
#define ColorOfHeaderBgView_DarkRed     ITHexColor(@"#d13b33",1)

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_LightGray;
    
    [self configNavigationBar];
    [self configHeaderView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)configNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil image:[UIImage imageNamed:@""]];
}

- (void)configHeaderView {
    UIView *headerView = [[UIView alloc] init];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(200 * AutoSizeScaleX);
    }];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)ColorOfHeaderBgView_LightRed.CGColor, (__bridge id)ColorOfHeaderBgView_DarkRed.CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200 * AutoSizeScaleX);
    [headerView.layer addSublayer:gradientLayer];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"mine_header_close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(12 * AutoSizeScaleX);
        make.top.equalTo(headerView).offset(25 * AutoSizeScaleX);
        make.width.height.mas_equalTo(25 * AutoSizeScaleX);
    }];
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn setImage:[UIImage imageNamed:@"mine_header_setting"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:settingBtn];
    [settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headerView).offset(- 12 * AutoSizeScaleX);
        make.top.equalTo(headerView).offset(25 * AutoSizeScaleX);
        make.width.height.mas_equalTo(25 * AutoSizeScaleX);
    }];
    
    UIButton *noticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [noticeBtn setImage:[UIImage imageNamed:@"mine_notice_icon"] forState:UIControlStateNormal];
    [noticeBtn addTarget:self action:@selector(noticeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:noticeBtn];
    [noticeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(settingBtn.mas_left).offset(- 16 * AutoSizeScaleX);
        make.top.equalTo(headerView).offset(25 * AutoSizeScaleX);
        make.width.height.mas_equalTo(25 * AutoSizeScaleX);
    }];
    
    UIImageView *headImageView = [[UIImageView alloc] init];
    headImageView.backgroundColor = ICColorOfBackground_Red;
    headImageView.layer.cornerRadius = 35.0 * AutoSizeScaleX;
    headImageView.layer.borderWidth = 1.0;
    headImageView.layer.borderColor = ICColorOfBorder_White.CGColor;
    [headerView addSubview:headImageView];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(80 * AutoSizeScaleX);
        make.centerX.equalTo(headerView);
        make.width.height.mas_equalTo(70 * AutoSizeScaleX);
    }];
    
    UIImageView *sexImageView = [[UIImageView alloc] init];
    sexImageView.image = [UIImage imageNamed:@"mine_personinfo_woman"];
    [headerView addSubview:sexImageView];
    [sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(headImageView);
        make.width.height.mas_equalTo(18 * AutoSizeScaleX);
    }];
    
    UILabel *nickNameLabel = [[UILabel alloc] init];
    nickNameLabel.text = @"阿毛";
    nickNameLabel.textColor = ICColorOfText_White;
    nickNameLabel.font = ICFontOfTitle_Chinese_16;
    [headerView addSubview:nickNameLabel];
    [nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headImageView);
        make.top.equalTo(headImageView.mas_bottom).offset(10 * AutoSizeScaleX);
    }];
    
    UIButton *headIconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [headIconBtn addTarget:self action:@selector(headIconBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:headIconBtn];
    [headIconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(headImageView);
        make.bottom.equalTo(nickNameLabel);
    }];
}

#pragma mark - Button Action
- (void)closeBtnAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)settingBtnAction:(UIButton *)sender {
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)noticeBtnAction:(UIButton *)sender {
    NoticeViewController *noticeVC = [[NoticeViewController alloc] init];
    [self.navigationController pushViewController:noticeVC animated:YES];
}

- (void)headIconBtnAction:(UIButton *)sender {
    PersonalInfoViewController *personalInfoVC = [[PersonalInfoViewController alloc] init];
    [self.navigationController pushViewController:personalInfoVC animated:YES];
}

@end
