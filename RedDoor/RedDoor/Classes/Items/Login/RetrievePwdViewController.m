//
//  RetrievePwdViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/2.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "RetrievePwdViewController.h"

@interface RetrievePwdViewController ()<UITextFieldDelegate>

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 手机号输入框 */
@property (nonatomic, strong) UITextField *userNameTextField;
/** 验证码输入框 */
@property (nonatomic, strong) UITextField *smsCodeTextField;
/** 获取验证码按钮 */
@property (nonatomic, strong) UIButton *getSmsCodeBtn;
/** 新密码输入框 */
@property (nonatomic, strong) UITextField *newpwdTextField;
/** 保存按钮 */
@property (nonatomic, strong) UIButton *saveBtn;

/** 定时器对象 */
@property (strong, nonatomic) NSTimer *timer;
/** 剩余秒数 */
@property (assign, nonatomic) NSInteger count;

@end

@implementation RetrievePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_White;
    
    [self configNavigationBar];
    [self configUserNameView];
    [self configSmsCodeView];
    [self configNewPwdView];
    [self configSaveBtn];
    
    [self addNotify];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if(self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)configNavigationBar {
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
    titleLabel.text = @"找回密码";
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.view);
    }];
    self.titleLabel = titleLabel;
}

- (void)configUserNameView {
    UITextField *userNameTextField = [[UITextField alloc] init];
    userNameTextField.delegate = self;
    userNameTextField.placeholder = @"请输入手机号";
    userNameTextField.font = ICFontOfTitle_Chinese_14;
    userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:userNameTextField];
    [userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(60 * AutoSizeScaleX);
        make.left.equalTo(self.view).offset(38 * AutoSizeScaleX);
        make.right.equalTo(self.view).offset(- 38 * AutoSizeScaleX);
        make.height.mas_equalTo(30 * AutoSizeScaleX);
    }];
    self.userNameTextField = userNameTextField;
    
    UIView *userNameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [userNameTextField setLeftViewMode:UITextFieldViewModeAlways];
    [userNameTextField setLeftView:userNameLeftView];
    
    UIImageView *userNameIconImageView = [[UIImageView alloc] init];
    userNameIconImageView.image = [UIImage imageNamed:@"login_icon_username"];
    [userNameLeftView addSubview:userNameIconImageView];
    [userNameIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userNameLeftView).offset(4 * AutoSizeScaleX);
        make.centerY.equalTo(userNameLeftView);
        make.width.height.mas_equalTo(24 * AutoSizeScaleX);
    }];
    
    UIView *dividingLine = [[UIView alloc] init];
    dividingLine.backgroundColor = ICColorOfBorder_Gray;
    [self.view addSubview:dividingLine];
    [dividingLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userNameTextField.mas_bottom);
        make.left.right.equalTo(userNameTextField);
        make.height.mas_equalTo(1);
    }];
}

- (void)configSmsCodeView {
    UITextField *smsCodeTextField = [[UITextField alloc] init];
    smsCodeTextField.delegate = self;
    smsCodeTextField.placeholder = @"请输入验证码";
    smsCodeTextField.font = ICFontOfTitle_Chinese_14;
    smsCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:smsCodeTextField];
    [smsCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(25 * AutoSizeScaleX);
        make.left.height.equalTo(self.userNameTextField);
        make.right.equalTo(self.view).offset(- 125 * AutoSizeScaleX);
    }];
    self.smsCodeTextField = smsCodeTextField;
    
    UIView *smsCodeLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [smsCodeTextField setLeftViewMode:UITextFieldViewModeAlways];
    [smsCodeTextField setLeftView:smsCodeLeftView];
    
    UIImageView *smsCodeIconImageView = [[UIImageView alloc] init];
    smsCodeIconImageView.image = [UIImage imageNamed:@"login_icon_smscode"];
    [smsCodeLeftView addSubview:smsCodeIconImageView];
    [smsCodeIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(smsCodeLeftView).offset(4 * AutoSizeScaleX);
        make.centerY.equalTo(smsCodeLeftView);
        make.width.height.mas_equalTo(24 * AutoSizeScaleX);
    }];
    
    UIButton *getSmsCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    getSmsCodeBtn.backgroundColor = ICColorOfBackground_Red;
    getSmsCodeBtn.layer.cornerRadius = 3.0;
    getSmsCodeBtn.titleLabel.font = ICFontOfTitle_Chinese_14;
    [getSmsCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getSmsCodeBtn setTitleColor:ICColorOfText_White forState:UIControlStateNormal];
    [getSmsCodeBtn addTarget:self action:@selector(getSmsCodeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getSmsCodeBtn];
    [getSmsCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(- 38 * AutoSizeScaleX);
        make.bottom.equalTo(smsCodeTextField).offset(- 5 * AutoSizeScaleX);
        make.width.mas_equalTo(85 * AutoSizeScaleX);
        make.height.mas_equalTo(26 * AutoSizeScaleX);
    }];
    self.getSmsCodeBtn = getSmsCodeBtn;
    
    UIView *dividingLine = [[UIView alloc] init];
    dividingLine.backgroundColor = ICColorOfBorder_Gray;
    [self.view addSubview:dividingLine];
    [dividingLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(smsCodeTextField.mas_bottom);
        make.left.equalTo(smsCodeTextField);
        make.right.equalTo(getSmsCodeBtn);
        make.height.mas_equalTo(1);
    }];
}

- (void)configNewPwdView {
    UITextField *newpwdTextField = [[UITextField alloc] init];
    newpwdTextField.delegate = self;
    newpwdTextField.placeholder = @"设置新密码";
    newpwdTextField.font = ICFontOfTitle_Chinese_14;
    newpwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:newpwdTextField];
    [newpwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.smsCodeTextField.mas_bottom).offset(25 * AutoSizeScaleX);
        make.left.right.height.equalTo(self.userNameTextField);
    }];
    self.newpwdTextField = newpwdTextField;
    
    UIView *newpwdLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [newpwdTextField setLeftViewMode:UITextFieldViewModeAlways];
    [newpwdTextField setLeftView:newpwdLeftView];
    
    UIImageView *newpwdIconImageView = [[UIImageView alloc] init];
    newpwdIconImageView.image = [UIImage imageNamed:@"login_icon_password"];
    [newpwdLeftView addSubview:newpwdIconImageView];
    [newpwdIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(newpwdLeftView).offset(4 * AutoSizeScaleX);
        make.centerY.equalTo(newpwdLeftView);
        make.width.height.mas_equalTo(24 * AutoSizeScaleX);
    }];
    
    UIView *dividingLine = [[UIView alloc] init];
    dividingLine.backgroundColor = ICColorOfBorder_Gray;
    [self.view addSubview:dividingLine];
    [dividingLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newpwdTextField.mas_bottom);
        make.left.right.equalTo(newpwdTextField);
        make.height.mas_equalTo(1);
    }];
}

- (void)configSaveBtn {
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.backgroundColor = ICColorOfBackground_Red;
    saveBtn.layer.cornerRadius = 3.0;
    saveBtn.titleLabel.font = ICFontOfTitle_Chinese_19;
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:ICColorOfText_White forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newpwdTextField.mas_bottom).offset(50 * AutoSizeScaleX);
        make.left.right.equalTo(self.newpwdTextField);
        make.height.mas_equalTo(40 * AutoSizeScaleX);
    }];
    self.saveBtn = saveBtn;
}

#pragma mark – Received Event
- (void)addNotify {
    [self.userNameTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.smsCodeTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.newpwdTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)editChanged:(UITextField *)textField {
    [self saveBtnState];
}

#pragma mark - Button Action
- (void)backBtnAction:(UIButton *)sender {
    [self.view endEditing:YES];
    NSLog(@"点击了返回按钮");
}

- (void)getSmsCodeBtnAction:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if ([self.userNameTextField.text isEqualToString:@""]) {
        [ITUIApplicationKeyWindow makeToast:@"请输入手机号"];
        return ;
    }
    [self startRun];
    [self requestSmsCode];
}

- (void)saveBtnAction:(UIButton *)sender {
    [self.view endEditing:YES];
    
    //密码长度不能少于6位
    if (self.newpwdTextField.text.length < 6) {
        [ITUIApplicationKeyWindow makeToast:@"密码长度不能少于6位"];
        return ;
    }
    
    //短信验证码验证
    ITWeakSelf(weakSelf);
    [SMSSDK commitVerificationCode:self.smsCodeTextField.text phoneNumber:self.userNameTextField.text zone:@"86" result:^(NSError *error) {
        if (error) {
            [ITUIApplicationKeyWindow makeToast:@"验证码错误"];
        } else {
            //发送注册请求
            [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
            [[UserDataManager sharedInstance] requestRetrievePasswordByUserName:self.userNameTextField.text confirmPassword:self.newpwdTextField.text complete:^(BOOL isSuccess, NSString *resultInfo) {
                [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
                [ITUIApplicationKeyWindow makeToast:resultInfo];
                if (isSuccess) {
                    NSLog(@"保存成功");
                }
            }];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - Private
- (void)saveBtnState {
    if ([self.userNameTextField.text isEqualToString:@""] || [self.smsCodeTextField.text isEqualToString:@""] || [self.newpwdTextField.text isEqualToString:@""]) {
        //不可点击
        self.saveBtn.enabled = NO;
        self.saveBtn.alpha = 0.3;
    } else {
        //可点击
        self.saveBtn.enabled = YES;
        self.saveBtn.alpha = 1;
    }
}

- (void)startRun {
    self.count = 60;
    if (!self.timer) {
        self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(fire) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
}

- (void)fire {
    if (self.count <= 0) {
        if(self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        
        [self.getSmsCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.getSmsCodeBtn.enabled = YES;
        self.getSmsCodeBtn.alpha = 1.0;
    } else {
        self.count --;
        NSString *title = [NSString stringWithFormat:@"%lds重新获取",self.count];
        [self.getSmsCodeBtn setTitle:title forState:UIControlStateNormal];
        self.getSmsCodeBtn.enabled = NO;
        self.getSmsCodeBtn.alpha = 0.3;
    }
}

- (void)requestSmsCode {
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.userNameTextField.text zone:@"86" template:nil result:^(NSError *error) {
        if (!error) {
            [ITUIApplicationKeyWindow makeToast:@"短信已发送"];
        } else {
            [ITUIApplicationKeyWindow makeToast:@"获取验证码失败"];
        }
    }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.userNameTextField) {
        if (string.length == 0) {
            return YES;
        }
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 11) {
            return NO;
        }
    } else if (textField == self.smsCodeTextField) {
        if (string.length == 0) {
            return YES;
        }
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 4) {
            return NO;
        }
    } else if (textField == self.newpwdTextField) {
        BOOL isLettersOrNumber = [string isLettersOrNumbers];
        if (!isLettersOrNumber) {
            return NO;
        }
    }
    return YES;
}

@end
