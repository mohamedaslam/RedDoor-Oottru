//
//  ICNavigationController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/2.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "ICNavigationController.h"
#import "MineViewController.h"

@interface ICNavigationController ()

@property (nonatomic, assign, getter=isPushing) BOOL pushing;

@end

@implementation ICNavigationController

+ (void)initialize {
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ICColorOfText_Black;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = ICColorOfText_DarkGray;
    disableTextAttrs[NSFontAttributeName] = textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化导航栏颜色及标题
    self.navigationBar.barTintColor = ICColorOfBackground_White;
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ICColorOfText_Black,NSForegroundColorAttributeName,ICFontOfTitle_Chinese_18,NSFontAttributeName,nil]];
    //打开默认侧滑pop手势
    self.interactivePopGestureRecognizer.delegate = (id)self;
    self.interactivePopGestureRecognizer.delaysTouchesBegan = NO;
}

@end
