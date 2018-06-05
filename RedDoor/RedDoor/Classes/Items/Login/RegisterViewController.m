//
//  RegisterViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/1.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 昵称输入框 */
@property (nonatomic, strong) UITextField *nickNameTextField;
/** 手机号输入框 */
@property (nonatomic, strong) UITextField *userNameTextField;
/** 验证码输入框 */
@property (nonatomic, strong) UITextField *smsCodeTextField;
/** 获取验证码按钮 */
@property (nonatomic, strong) UIButton *getSmsCodeBtn;
/** 密码输入框 */
@property (nonatomic, strong) UITextField *pwdTextField;
/** 注册按钮 */
@property (nonatomic, strong) UIButton *registerBtn;

/** 定时器对象 */
@property (strong, nonatomic) NSTimer *timer;
/** 剩余秒数 */
@property (assign, nonatomic) NSInteger count;

@end

@implementation RegisterViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_White;
    
    [self configBackBtn];
    [self configTitleView];
    [self configNickNameView];
    [self configUserNameView];
    [self configSmsView];
    [self configPwdView];
    [self configRegisterBtn];
    [self registerBtnState];
    
    [self addNotify];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if(self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)configBackBtn {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"login_back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(5 * AutoSizeScaleX);
        make.top.equalTo(self.view).offset(25 * AutoSizeScaleX);
        make.width.height.mas_equalTo(25 * AutoSizeScaleX);
    }];
}

- (void)configTitleView {
    NSString *titleStr = @"你好！\n欢迎使用红门";
    NSString *grayColorText = @"你好！\n欢迎使用";
    NSString *redColorText = @"红门";
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:titleStr];
    NSRange grayColorTextRange = [titleStr rangeOfString:grayColorText];
    NSRange redColorTextRange = [titleStr rangeOfString:redColorText];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:ICColorOfText_DarkGray range:grayColorTextRange];
    [attributedString addAttribute:NSForegroundColorAttributeName value:ICColorOfText_Red range:redColorTextRange];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:3];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0.5, [attributedString length])];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.attributedText = attributedString;
    titleLabel.font = [UIFont boldSystemFontOfSize:21];
    titleLabel.numberOfLines = 0;
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(38 * AutoSizeScaleX);
        make.top.equalTo(self.view).offset(70 * AutoSizeScaleX);
    }];
    NSLog(@"%f",AutoSizeScaleX);
    self.titleLabel = titleLabel;
}

- (void)configNickNameView {
    UITextField *nickNameTextField = [[UITextField alloc] init];
    nickNameTextField.delegate = self;
    nickNameTextField.placeholder = @"请输入昵称";
    nickNameTextField.font = ICFontOfTitle_Chinese_14;
    [self.view addSubview:nickNameTextField];
    [nickNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(50 * AutoSizeScaleX);
        make.left.equalTo(self.view).offset(38 * AutoSizeScaleX);
        make.right.equalTo(self.view).offset(- 38 * AutoSizeScaleX);
        make.height.mas_equalTo(30 * AutoSizeScaleX);
    }];
    self.nickNameTextField = nickNameTextField;
    
    UIView *nickNameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [nickNameTextField setLeftViewMode:UITextFieldViewModeAlways];
    [nickNameTextField setLeftView:nickNameLeftView];
    
    UIImageView *nickNameIconImageView = [[UIImageView alloc] init];
    nickNameIconImageView.image = [UIImage imageNamed:@"login_icon_nickname"];
    [nickNameLeftView addSubview:nickNameIconImageView];
    [nickNameIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickNameLeftView).offset(4 * AutoSizeScaleX);
        make.centerY.equalTo(nickNameLeftView);
        make.width.height.mas_equalTo(24 * AutoSizeScaleX);
    }];
    
    UIView *dividingLine = [[UIView alloc] init];
    dividingLine.backgroundColor = ICColorOfBorder_Gray;
    [self.view addSubview:dividingLine];
    [dividingLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nickNameTextField.mas_bottom);
        make.left.right.equalTo(nickNameTextField);
        make.height.mas_equalTo(1);
    }];
    NSLog(@"sdfasdfasdf%f",AutoSizeScaleX);

}

- (void)configUserNameView {
    UITextField *userNameTextField = [[UITextField alloc] init];
    userNameTextField.delegate = self;
    userNameTextField.placeholder = @"请输入手机号";
    userNameTextField.font = ICFontOfTitle_Chinese_14;
    userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:userNameTextField];
    [userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameTextField.mas_bottom).offset(25 * AutoSizeScaleX);
        make.left.right.height.equalTo(self.nickNameTextField);
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

- (void)configSmsView {
    UITextField *smsTextField = [[UITextField alloc] init];
    smsTextField.delegate = self;
    smsTextField.placeholder = @"请输入验证码";
    smsTextField.font = ICFontOfTitle_Chinese_14;
    smsTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:smsTextField];
    [smsTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(25 * AutoSizeScaleX);
        make.left.height.equalTo(self.userNameTextField);
        make.right.equalTo(self.view).offset(- 125 * AutoSizeScaleX);
    }];
    self.smsCodeTextField = smsTextField;
    
    UIView *smsLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [smsTextField setLeftViewMode:UITextFieldViewModeAlways];
    [smsTextField setLeftView:smsLeftView];
    
    UIImageView *smsIconImageView = [[UIImageView alloc] init];
    smsIconImageView.image = [UIImage imageNamed:@"login_icon_smscode"];
    [smsLeftView addSubview:smsIconImageView];
    [smsIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(smsLeftView).offset(4 * AutoSizeScaleX);
        make.centerY.equalTo(smsLeftView);
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
        make.bottom.equalTo(smsTextField).offset(- 5 * AutoSizeScaleX);
        make.width.mas_equalTo(85 * AutoSizeScaleX);
        make.height.mas_equalTo(26 * AutoSizeScaleX);
    }];
    self.getSmsCodeBtn = getSmsCodeBtn;
    
    UIView *dividingLine = [[UIView alloc] init];
    dividingLine.backgroundColor = ICColorOfBorder_Gray;
    [self.view addSubview:dividingLine];
    [dividingLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(smsTextField.mas_bottom);
        make.left.equalTo(smsTextField);
        make.right.equalTo(getSmsCodeBtn);
        make.height.mas_equalTo(1);
    }];
}

- (void)configPwdView {
    UITextField *pwdTextField = [[UITextField alloc] init];
    pwdTextField.delegate = self;
    pwdTextField.placeholder = @"请输入密码";
    pwdTextField.font = ICFontOfTitle_Chinese_14;
    pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:pwdTextField];
    [pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.smsCodeTextField.mas_bottom).offset(25 * AutoSizeScaleX);
        make.left.right.height.equalTo(self.userNameTextField);
    }];
    self.pwdTextField = pwdTextField;
    
    UIView *pwdLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [pwdTextField setLeftViewMode:UITextFieldViewModeAlways];
    [pwdTextField setLeftView:pwdLeftView];
    
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
        make.top.equalTo(pwdTextField.mas_bottom);
        make.left.right.equalTo(pwdTextField);
        make.height.mas_equalTo(1);
    }];
}

- (void)configRegisterBtn {
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.backgroundColor = ICColorOfBackground_Red;
    registerBtn.layer.cornerRadius = 3.0;
    registerBtn.titleLabel.font = ICFontOfTitle_Chinese_19;
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:ICColorOfText_White forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTextField.mas_bottom).offset(50 * AutoSizeScaleX);
        make.left.right.equalTo(self.pwdTextField);
        make.height.mas_equalTo(40 * AutoSizeScaleX);
    }];
    self.registerBtn = registerBtn;
}

#pragma mark – Received Event
- (void)addNotify {
    [self.nickNameTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.userNameTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.smsCodeTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)editChanged:(UITextField *)textField {
    [self registerBtnState];
}

- (void)keyboardWillShow:(NSNotification *)notice {
    self.titleLabel.hidden = YES;
    [self.nickNameTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(70 * AutoSizeScaleX);
        make.left.equalTo(self.view).offset(38 * AutoSizeScaleX);
        make.right.equalTo(self.view).offset(- 38 * AutoSizeScaleX);
        make.height.mas_equalTo(30 * AutoSizeScaleX);
    }];
}

- (void)keyboardWillHide:(NSNotification *)notice {
    self.titleLabel.hidden = NO;
    [self.nickNameTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(50 * AutoSizeScaleX);
        make.left.equalTo(self.view).offset(38 * AutoSizeScaleX);
        make.right.equalTo(self.view).offset(- 38 * AutoSizeScaleX);
        make.height.mas_equalTo(30 * AutoSizeScaleX);
    }];
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

- (void)registerBtnAction:(UIButton *)sender {
    [self.view endEditing:YES];
    
    //密码长度不能少于6位
    if (self.pwdTextField.text.length < 6) {
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
            [[UserDataManager sharedInstance] requestRegisterByUserName:weakSelf.userNameTextField.text password:weakSelf.pwdTextField.text nickName:weakSelf.nickNameTextField.text complete:^(BOOL isSuccess, NSString *resultInfo) {
                [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
                [ITUIApplicationKeyWindow makeToast:resultInfo];
                if (isSuccess) {
                    NSLog(@"注册成功");
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
- (void)registerBtnState {
    if ([self.nickNameTextField.text isEqualToString:@""] || [self.userNameTextField.text isEqualToString:@""] || [self.smsCodeTextField.text isEqualToString:@""] || [self.pwdTextField.text isEqualToString:@""]) {
        //不可点击
        self.registerBtn.enabled = NO;
        self.registerBtn.alpha = 0.3;
    } else {
        //可点击
        self.registerBtn.enabled = YES;
        self.registerBtn.alpha = 1;
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
    if (textField == self.nickNameTextField) {
        if (string.length == 0) {
            return YES;
        }
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 16) {
            return NO;
        }
    } else if (textField == self.userNameTextField) {
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
    } else if (textField == self.pwdTextField) {
        BOOL isLettersOrNumber = [string isLettersOrNumbers];
        if (!isLettersOrNumber) {
            return NO;
        }
    }
    return YES;
}

@end
