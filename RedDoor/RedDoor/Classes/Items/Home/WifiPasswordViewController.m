//
//  WifiPasswordViewController.m
//  RedDoor
//
//  Created by Mohammed Aslam on 21/06/18.
//  Copyright © 2018 QianWei Huang. All rights reserved.
//

#import "WifiPasswordViewController.h"

@interface WifiPasswordViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UIView *titleView;

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *wifititleLabel;

/** 注册按钮 */
@property (nonatomic, strong) UIButton *submitBtn;
/** 手机号输入框 */
@property (nonatomic, strong) UITextField *passwordTextField;
@end

@implementation WifiPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_White;
    [self configNavigationBar];
    [self wifiLabelsView];
    [self configUserNameView];
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
    wifititleLabel.text = @"长按插座按 Wi-Fi";
    wifititleLabel.font = [UIFont boldSystemFontOfSize:18];
    wifititleLabel.textAlignment = NSTextAlignmentCenter;
    wifititleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:wifititleLabel];
    [wifititleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleView).offset(100 * AutoSizeScaleX);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(200 * AutoSizeScaleX);
        make.height.height.mas_equalTo(22 * AutoSizeScaleX);
    }];
    self.wifititleLabel = wifititleLabel;
   
    
}
- (void)configUserNameView {
    UITextField *passwordTextField = [[UITextField alloc] init];
    passwordTextField.delegate = self;
    passwordTextField.placeholder = @"请输入密码";
    passwordTextField.font = ICFontOfTitle_Chinese_14;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:passwordTextField];
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wifititleLabel.mas_bottom).offset(100 * AutoSizeScaleX);
        make.left.equalTo(self.view).offset(38 * AutoSizeScaleX);
        make.right.equalTo(self.view).offset(- 38 * AutoSizeScaleX);
        make.height.mas_equalTo(30 * AutoSizeScaleX);
    }];
    self.passwordTextField = passwordTextField;
    
    UIView *pwdLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
    [passwordTextField setLeftView:pwdLeftView];
    
    UIImageView *pwdIconImageView = [[UIImageView alloc] init];
    pwdIconImageView.image = [UIImage imageNamed:@"login_icon_password"];
    [pwdLeftView addSubview:pwdIconImageView];
    [pwdIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdLeftView).offset(4 * AutoSizeScaleX);
        make.centerY.equalTo(pwdLeftView);
        make.width.height.mas_equalTo(24 * AutoSizeScaleX);
    }];
    
    UIView *dividingLine = [[UIView alloc] init];
    dividingLine.backgroundColor = ICColorOfBorder_Gray;
    [self.view addSubview:dividingLine];
    [dividingLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordTextField.mas_bottom);
        make.left.right.equalTo(passwordTextField);
        make.height.mas_equalTo(1);
    }];
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
