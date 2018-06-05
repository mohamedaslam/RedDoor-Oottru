//
//  PersonalInfoViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "PersonalInfoTableViewCell.h"

typedef NS_ENUM(NSInteger, PersonalInfoSection) {
    PersonalInfoSectionOne,
    PersonalInfoSectionTwo,
    PersonalInfoSectionAll,
};

typedef NS_ENUM(NSInteger, PersonalInfoRow) {
    PersonalInfoRow_HeadIcon = 0,//头像
    PersonalInfoRow_NickName,//昵称
    PersonalInfoRow_Account,//账号
    PersonalInfoSectionOneRowAll,
    
    PersonalInfoRow_Sex = 0,//性别
    PersonalInfoRow_Location,//地区
    PersonalInfoSectionTwoRowAll,
};

@interface PersonalInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_LightGray;
    
    [self configNavigationBar];
    [self configTableView];
}

- (void)configNavigationBar {
    self.title = @"个人资料";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftBarBtnAction:) image:[UIImage imageNamed:@"login_back"]];
}

- (void)configTableView {
    UITableView *personalInfoTableView = [[UITableView alloc] init];
    [personalInfoTableView setBackgroundColor:ICColorOfBackground_LightGray];
    [personalInfoTableView setSeparatorColor:ICColorOfBorder_Gray];
    [personalInfoTableView setDelegate:self];
    [personalInfoTableView setDataSource:self];
    [personalInfoTableView setBounces:NO];
    [personalInfoTableView setShowsVerticalScrollIndicator:NO];
    [personalInfoTableView setEstimatedRowHeight:0];
    [personalInfoTableView setTableFooterView:[[UIView alloc] init]];
    if ([personalInfoTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [personalInfoTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([personalInfoTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [personalInfoTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    [self.view addSubview:personalInfoTableView];
    [personalInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    return PersonalInfoSectionAll;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == PersonalInfoSectionOne) {
        return PersonalInfoSectionOneRowAll;
    } else if (section == PersonalInfoSectionTwo) {
        return PersonalInfoSectionTwoRowAll;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10 * AutoSizeScaleX;
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
    static NSString *personalInfoTableViewCellId = @"personalInfoTableViewCellId";
    PersonalInfoTableViewCell *personalInfoTableViewCell = [tableView dequeueReusableCellWithIdentifier:personalInfoTableViewCellId];
    if (personalInfoTableViewCell == nil) {
        personalInfoTableViewCell = [[PersonalInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalInfoTableViewCellId];
    }
    
    return personalInfoTableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
