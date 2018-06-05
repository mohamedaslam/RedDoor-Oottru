//
//  SettingViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"

typedef NS_ENUM(NSInteger, SettingSection) {
    SettingSectionOne,
    SettingSectionTwo,
    SettingSectionThree,
    SettingSectionAll,
};

typedef NS_ENUM(NSInteger, SettingRow) {
    SettingRow_AccountSafe = 0,//账号与安全
    SettingRow_LanguageSettings,//语言设置
    SettingSectionOneRowAll,
    
    SettingRow_CommonProblems = 0,//常见问题
    SettingRow_About,//关于HongMen
    SettingSectionTwoRowAll,
    
    SettingRow_Quit = 0,//退出账号
    SettingSectionThreeRowAll,
};

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_LightGray;
    
    [self configNavigationBar];
    [self configTableView];
}

- (void)configNavigationBar {
    self.title = @"设置";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftBarBtnAction:) image:[UIImage imageNamed:@"login_back"]];
}

- (void)configTableView {
    UITableView *settingTableView = [[UITableView alloc] init];
    [settingTableView setBackgroundColor:ICColorOfBackground_LightGray];
    [settingTableView setSeparatorColor:ICColorOfBorder_LightGray];
    [settingTableView setDelegate:self];
    [settingTableView setDataSource:self];
    [settingTableView setBounces:NO];
    [settingTableView setShowsVerticalScrollIndicator:NO];
    [settingTableView setEstimatedRowHeight:0];
    [settingTableView setTableFooterView:[[UIView alloc] init]];
    if ([settingTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [settingTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([settingTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [settingTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    [self.view addSubview:settingTableView];
    [settingTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Button Action
- (void)leftBarBtnAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tableView Delegate && DataSource
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SettingSectionAll;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == SettingSectionOne) {
        return SettingSectionOneRowAll;
    } else if (section == SettingSectionTwo) {
        return SettingSectionTwoRowAll;
    } else if (section == SettingSectionThree) {
        return SettingSectionThreeRowAll;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == SettingSectionOne || section == SettingSectionTwo) {
        return 10 * AutoSizeScaleX;
    } else if (section == SettingSectionThree) {
        return 30 * AutoSizeScaleX;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 43 * AutoSizeScaleX;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *settingTableCellId = @"settingTableCellId";
    SettingTableViewCell *settingTableCell = [tableView dequeueReusableCellWithIdentifier:settingTableCellId];
    if (settingTableCell == nil) {
        settingTableCell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:settingTableCellId];
    }
    
    if (indexPath.section == SettingSectionOne) {
        settingTableCell.titleLabel.hidden = NO;
        settingTableCell.nextImageView.hidden = NO;
        settingTableCell.subTitleLabel.hidden = YES;
        settingTableCell.quitLabel.hidden = YES;
        if (indexPath.row == SettingRow_AccountSafe) {
            //账号与安全
            settingTableCell.titleLabel.text = @"账号与安全";
        } else if (indexPath.row == SettingRow_LanguageSettings) {
            //语言设置
            settingTableCell.titleLabel.text = @"语言设置";
        }
    } else if (indexPath.section == SettingSectionTwo) {
        settingTableCell.titleLabel.hidden = NO;
        settingTableCell.quitLabel.hidden = YES;
        if (indexPath.row == SettingRow_CommonProblems) {
            //常见问题
            settingTableCell.nextImageView.hidden = NO;
            settingTableCell.subTitleLabel.hidden = YES;
            settingTableCell.titleLabel.text = @"常见问题";
        } else if (indexPath.row == SettingRow_About) {
            //关于HongMen
            settingTableCell.nextImageView.hidden = YES;
            settingTableCell.subTitleLabel.hidden = NO;
            settingTableCell.titleLabel.text = @"关于HongMen";
            settingTableCell.subTitleLabel.text = @"v1.0.0";
        }
    } else if (indexPath.section == SettingSectionThree) {
        if (indexPath.row == SettingRow_Quit) {
            //退出账号
            settingTableCell.titleLabel.hidden = YES;
            settingTableCell.nextImageView.hidden = YES;
            settingTableCell.subTitleLabel.hidden = YES;
            settingTableCell.quitLabel.hidden = NO;
        }
    }
    
    return settingTableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
