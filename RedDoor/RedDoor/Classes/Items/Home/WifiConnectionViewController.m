//
//  WifiConnectionViewController.m
//  RedDoor
//
//  Created by Mohammed Aslam on 21/06/18.
//  Copyright © 2018 QianWei Huang. All rights reserved.
//

#import "WifiConnectionViewController.h"

@interface WifiConnectionViewController ()
@property (nonatomic,strong) UIView *titleView;

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *wifititleLabel;

/** 注册按钮 */
@property (nonatomic, strong) UIButton *submitBtn;
@end

@implementation WifiConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_White;
    [self configNavigationBar];
    [self wifiLabelsView];
    // Do any additional setup after loading the view.
}
- (void)configNavigationBar {
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, ITNavigationBarMaxY, SCREEN_WIDTH, 1)];
    [titleView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"login_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(5 * AutoSizeScaleX);
        make.top.equalTo(self.view).offset(25 * AutoSizeScaleX);
        make.width.height.mas_equalTo(25 * AutoSizeScaleX);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"Wi-Fi配置";
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.view);
    }];
    self.titleLabel = titleLabel;
}
-(void)submitBtnView
{
    //Submit button
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [submitBtn setBackgroundColor:[UIColor greenColor]];
    [submitBtn setExclusiveTouch:YES];
    [submitBtn setTitle:@"下一步" forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    submitBtn.layer.cornerRadius = 3;
    submitBtn.layer.masksToBounds = YES;
    [self.view addSubview:submitBtn];
    self.submitBtn = submitBtn;
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.passwordTextField).offset(100 * AutoSizeScaleX);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(260 * AutoSizeScaleX);
        make.height.height.mas_equalTo(42 * AutoSizeScaleX);
    }];
}
#pragma mark - Button Action
- (void)backBtnAction:(UIButton *)sender {
    [self.view endEditing:YES];
    NSLog(@"点击了返回按钮");
}
- (void)submitBtnClicked:(UIButton *)sender {
    NSLog(@"Submit");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
