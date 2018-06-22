//
//  WifiViewController.m
//  RedDoor
//
//  Created by Mohammed Aslam on 15/06/18.
//  Copyright © 2018 QianWei Huang. All rights reserved.
//

#import "WifiViewController.h"
#import "MineViewController.h"
#import "WifiSetupViewController.h"

@interface WifiViewController ()
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *wifititleLabel;
@property (nonatomic, strong) UILabel *wifiDescriptionLabel;
@property (nonatomic, strong) UILabel *wifiLabel;
@property (nonatomic,strong) UIView *titleView;
/** 注册按钮 */
@property (nonatomic, strong) UIButton *submitBtn;

@end

@implementation WifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_White;
    [self configNavigationBar];
    [self wifiLabelsView];
    [self submitBtnView];

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
-(void)wifiLabelsView{
    UILabel *wifititleLabel = [[UILabel alloc] init];
    wifititleLabel.text = @"长按插座按2.4G Wi-Fi";
    wifititleLabel.font = [UIFont boldSystemFontOfSize:18];
    wifititleLabel.textAlignment = NSTextAlignmentCenter;
    wifititleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:wifititleLabel];
    [wifititleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleView).offset(100 * AutoSizeScaleX);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(200 * AutoSizeScaleX);
        make.height.height.mas_equalTo(32 * AutoSizeScaleX);
    }];
    self.wifititleLabel = wifititleLabel;
    
    UILabel *wifiDescriptionLabel = [[UILabel alloc] init];
    wifiDescriptionLabel.text = @"长按插座按键6秒长按插座5GWi-Fi按键:\n Knectek-WIFI-5G\n长按插座按键6秒\n长按插座按键秒长按插座";
    wifiDescriptionLabel.font = [UIFont boldSystemFontOfSize:16];
    wifiDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    wifiDescriptionLabel.numberOfLines = 0;
    wifiDescriptionLabel.textAlignment = NSTextAlignmentCenter;
    wifiDescriptionLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:wifiDescriptionLabel];
    [wifiDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.wifititleLabel).offset(132 * AutoSizeScaleX);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(200 * AutoSizeScaleX);
        make.height.height.mas_equalTo(100 * AutoSizeScaleX);
    }];
    self.wifiDescriptionLabel = wifiDescriptionLabel;
    
    UILabel *wifiLabel = [[UILabel alloc] init];
    wifiLabel.text = @"长按插座按键6秒长按插座5GWi-Fi按键 \n 长按插座按2.4G Wi-Fi";
    wifiLabel.font = [UIFont boldSystemFontOfSize:18];
    wifiLabel.textAlignment = NSTextAlignmentCenter;
    wifiLabel.lineBreakMode = NSLineBreakByWordWrapping;
    wifiLabel.numberOfLines = 0;
    wifiLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:wifiLabel];
    [wifiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.wifiDescriptionLabel).offset(142 * AutoSizeScaleX);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(260 * AutoSizeScaleX);
        make.height.height.mas_equalTo(50 * AutoSizeScaleX);
    }];
    self.wifiLabel = wifiLabel;

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
        make.bottom.equalTo(self.wifiLabel).offset(60 * AutoSizeScaleX);
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
    WifiSetupViewController *VCB = [[WifiSetupViewController alloc]init];
    [self presentViewController:VCB animated:YES completion:nil];
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
