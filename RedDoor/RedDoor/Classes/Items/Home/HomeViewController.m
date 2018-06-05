//
//  HomeViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/2.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "HomeViewController.h"
#import "MineViewController.h"

#define PlusMenuTitle @[@"添加插座", @"扫一扫"]
#define PlusMenuIcon @[@"home_add_socket", @"home_add_scan"]
#define PlusMenuW 130

typedef NS_ENUM(NSInteger, PlusMenuRowType) {
    PlusMenuRowType_AddSocket,
    PlusMenuRowType_Scan,
};

@interface HomeViewController ()<YBPopupMenuDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.view.backgroundColor = ICColorOfBackground_LightGray;
    
    [self configNavigationBar];
    [[UserDataManager sharedInstance] requestRegisterByUserName:@"18659514599" password:@"123456" nickName:@"阿毛" complete:^(BOOL isSuccess, NSString *resultInfo) {
        int i = 0;
    }];
}

- (void)configNavigationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftBarBtnAction:) headIconImageStr:@"" placeholderImage:[UIImage imageNamed:@"home_usericon_default"]];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightBarBtnAction:) image:[UIImage imageNamed:@"home_add"]];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ITNavigationBarTitleViewH)];
    self.navigationItem.titleView = titleView;
    
    UIImage *logoImage = [UIImage imageNamed:@"login_logo"];
    CGFloat logoImageScale = logoImage.size.height / logoImage.size.width;
    
    UIImageView *titleImageView = [[UIImageView alloc] init];
    titleImageView.image = logoImage;
    [titleView addSubview:titleImageView];
    [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(titleView);
        make.width.mas_equalTo(110 * AutoSizeScaleX);
        make.height.equalTo(titleImageView.mas_width).multipliedBy(logoImageScale);
    }];
}

#pragma mark - Button Action
- (void)leftBarBtnAction:(UIButton *)sender {
    MineViewController *mineVC = [[MineViewController alloc] init];
    [self.navigationController pushViewController:mineVC animated:YES];
}

- (void)rightBarBtnAction:(UIButton *)sender {
    YBPopupMenu *popupMenu = [YBPopupMenu showRelyOnView:sender titles:PlusMenuTitle icons:PlusMenuIcon menuWidth:PlusMenuW delegate:self];
    popupMenu.fontSize = 12;
    popupMenu.textColor = ICColorOfText_Black;
}

#pragma mark - YBPopupMenuDelegate
- (void)ybPopupMenu:(YBPopupMenu *)ybPopupMenu didSelectedAtIndex:(NSInteger)index {
    switch (index) {
        case PlusMenuRowType_AddSocket: {
            //添加插座
            [ITUIApplicationKeyWindow makeToast:@"添加插座功能开发中"];
        }
            break;
            
        case PlusMenuRowType_Scan: {
            //扫一扫
            [ITUIApplicationKeyWindow makeToast:@"扫一扫功能开发中"];
        }
            break;
            
        default:
            break;
    }
}

@end
