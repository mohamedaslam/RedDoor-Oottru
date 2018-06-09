//
//  LoginViewController.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/5/31.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController()<UITextFieldDelegate>

/** LoginLogo ImageView */
@property (nonatomic, strong) UIImageView *logoImageView;
/** LoginBG View */
@property (nonatomic, strong) UIView *loginButtonsBGView;
/**  UserName TextField */
@property (nonatomic, strong) UITextField *userNameTextField;
/** Password TextField */
@property (nonatomic, strong) UITextField *pwdTextField;
/** pwdSecretVisible Button */
@property (nonatomic, strong) UIButton *pwdSecretVisibleBtn;
/** username DivideLine Label */
@property (nonatomic, strong) UILabel *userNameDivideLineLabel;
/** pwd DivideLine Label */
@property (nonatomic, strong) UILabel *pwdDivideLineLabel;
/** submit Button */
@property (nonatomic, strong) UIButton *submitBtn;

@end

@implementation LoginViewController
#pragma mark – Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ICColorOfBackground_White;
  
    [self setupUI];
    [self UserNameView];
    [self PasswordView];
    [self submitBtnView];
    [self registerBtnView];
    [self forgetPwdBtnView];
    [self submitBtnState];
    [self addNotify];
    
}
- (void)setupUI {
    UIImage *logoImage = [UIImage imageNamed:@"login_logo"];
    CGFloat logoImageScale = logoImage.size.height / logoImage.size.width;
    // Logo Icon ImageView
    self.logoImageView = [[UIImageView alloc]init];
    [self.logoImageView setImage:[UIImage imageNamed:@"login_logo"]];
    [self.logoImageView setContentMode:UIViewContentModeScaleAspectFit];
    self.logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.logoImageView];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100 * AutoSizeScaleX);
        make.width.mas_equalTo(160 * AutoSizeScaleX);
        make.height.equalTo(self.logoImageView.mas_width).multipliedBy(logoImageScale);
    }];
    // Loginbuttons BG View
    self.loginButtonsBGView =[[UIView alloc]init];
    self.loginButtonsBGView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.loginButtonsBGView];
    [self.loginButtonsBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoImageView).offset(90* AutoSizeScaleX);
        make.left.equalTo(self.view.mas_left).offset(26* AutoSizeScaleX);
        make.right.equalTo(self.view.mas_right).offset(-26 *AutoSizeScaleX);
        make.height.mas_equalTo(300 * AutoSizeScaleX);
    }];
    
}

- (void)UserNameView {
    
    //UserName TextFiled
    self.userNameTextField = [[UITextField alloc] init];
    self.userNameTextField.borderStyle = UITextBorderStyleNone;
    self.userNameTextField.placeholder = @"请输入手机号";
    self.userNameTextField.font = ICFontOfTitle_Chinese_14;
    self.userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.userNameTextField.delegate = self;
    [self.loginButtonsBGView addSubview:self.userNameTextField];
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButtonsBGView).offset(4* AutoSizeScaleX);
        make.left.equalTo(self.loginButtonsBGView).offset(4* AutoSizeScaleX);
        make.right.equalTo(self.loginButtonsBGView).offset(-4* AutoSizeScaleX);
        make.height.mas_equalTo(40* AutoSizeScaleX);
    }];
    
    UIView *nickNameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [self.userNameTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.userNameTextField setLeftView:nickNameLeftView];
    UIImageView *nickNameIconImageView = [[UIImageView alloc] init];
    nickNameIconImageView.image = [UIImage imageNamed:@"login_icon_username"];
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
        make.top.equalTo(self.userNameTextField.mas_bottom);
        make.left.right.equalTo(self.userNameTextField);
        make.height.mas_equalTo(1);
    }];
}

-(void)PasswordView
{
    //Password TextFiled
    self.pwdTextField = [[UITextField alloc] init];
    self.pwdTextField.placeholder = @"请输入密码";
    self.pwdTextField.font = ICFontOfTitle_Chinese_14;
    self.pwdTextField.secureTextEntry = YES;
    self.pwdTextField.delegate = self;
    [self.loginButtonsBGView addSubview:self.pwdTextField];
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameTextField).offset(60* AutoSizeScaleX);
        make.left.equalTo(self.loginButtonsBGView).offset(4* AutoSizeScaleX);
        make.right.equalTo(self.loginButtonsBGView).offset(-4* AutoSizeScaleX);
        make.height.mas_equalTo(40* AutoSizeScaleX);
    }];
    
    UIView *nickNameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 36 * AutoSizeScaleX, 30 * AutoSizeScaleX)];
    [self.pwdTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.pwdTextField setLeftView:nickNameLeftView];
    UIImageView *nickNameIconImageView = [[UIImageView alloc] init];
    nickNameIconImageView.image = [UIImage imageNamed:@"login_icon_password"];
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
        make.top.equalTo(self.pwdTextField.mas_bottom);
        make.left.right.equalTo(self.pwdTextField);
        make.height.mas_equalTo(1);
    }];
    //Password ScrectVisile btn
    self.pwdSecretVisibleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pwdSecretVisibleBtn addTarget:self action:@selector(pwdSecretVisibleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *btnImage = [UIImage imageNamed:@"login_secret_visible"];
    [self.pwdSecretVisibleBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
    [self.pwdSecretVisibleBtn setExclusiveTouch:YES];
    self.pwdSecretVisibleBtn.layer.cornerRadius = 10;
    self.pwdSecretVisibleBtn.layer.masksToBounds = YES;
    [self.loginButtonsBGView addSubview:self.pwdSecretVisibleBtn];
    [self.pwdSecretVisibleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameTextField).offset(70* AutoSizeScaleX);
        make.right.equalTo(self.loginButtonsBGView).offset(-6* AutoSizeScaleX);
        make.height.mas_equalTo(22* AutoSizeScaleX);
        make.width.mas_equalTo(22* AutoSizeScaleX);
        
    }];
}
-(void)submitBtnView
{
    //Submit button
    self.submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.submitBtn setBackgroundColor:ICColorOfBackground_Red];
    [self.submitBtn setExclusiveTouch:YES];
    [self.submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
    self.submitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    self.submitBtn.layer.cornerRadius = 3;
    self.submitBtn.layer.masksToBounds = YES;
    [self.loginButtonsBGView addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTextField).offset(90* AutoSizeScaleX);
        make.left.equalTo(self.loginButtonsBGView).offset(4* AutoSizeScaleX);
        make.right.equalTo(self.loginButtonsBGView).offset(-4* AutoSizeScaleX);
        make.height.mas_equalTo(44 * AutoSizeScaleX);
    }];
}
-(void)registerBtnView
{
    //Register Button
    UIButton *forgotPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgotPasswordBtn addTarget:self action:@selector(forgetPwdbtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [forgotPasswordBtn setTitleColor:ICColorOfText_Gray forState:UIControlStateNormal];
    [forgotPasswordBtn setExclusiveTouch:YES];
    forgotPasswordBtn.layer.cornerRadius = 10;
    [forgotPasswordBtn setTitle:@"Forgot Password" forState:UIControlStateNormal];
    forgotPasswordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    forgotPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    forgotPasswordBtn.layer.masksToBounds = YES;
    [self.loginButtonsBGView addSubview:forgotPasswordBtn];
    [forgotPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.submitBtn).offset(58* AutoSizeScaleX);
        make.left.equalTo(self.loginButtonsBGView).offset(4* AutoSizeScaleX);
        make.width.mas_equalTo(120* AutoSizeScaleX);
        make.height.mas_equalTo(50* AutoSizeScaleX);
    }];
}
-(void)forgetPwdBtnView{
    //Forget password button
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.titleLabel.font = ICFontOfTitle_Chinese_19;
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [registerBtn setTitleColor:ICColorOfText_Gray forState:UIControlStateNormal];
    [self.loginButtonsBGView addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.submitBtn).offset(58* AutoSizeScaleX);
        make.right.equalTo(self.loginButtonsBGView).offset(-4* AutoSizeScaleX);
        make.width.mas_equalTo(126* AutoSizeScaleX);
        make.height.mas_equalTo(50* AutoSizeScaleX);
    }];
}


#pragma mark – Button Action

-(void) pwdSecretVisibleBtnClicked:(UIButton*)sender
{
    if (self.pwdTextField.secureTextEntry == YES) {
        UIImage *btnImage = [UIImage imageNamed:@"login_secret_unvisible"];
        [self.pwdSecretVisibleBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
        self.pwdTextField.secureTextEntry = NO;
    }else{
        UIImage *btnImage = [UIImage imageNamed:@"login_secret_visible"];
        [self.pwdSecretVisibleBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
        self.pwdTextField.secureTextEntry = YES;
    }
}
-(void) submitBtnClicked:(UIButton*)sender
{
    [_pwdTextField resignFirstResponder];
    [ITUIApplicationKeyWindow makeToast:@"Incorrect username and password"];

}
-(void) registerBtnClicked:(UIButton*)sender
{
    
}
-(void) forgetPwdbtnClicked:(UIButton*)sender
{
    
}

#pragma mark – Received Event
- (void)addNotify {
    [self.userNameTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextField addTarget:self action:@selector(editChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)editChanged:(UITextField *)textField {
    [self submitBtnState];
}

#pragma mark - Private
- (void)submitBtnState {
    if ([self.userNameTextField.text isEqualToString:@""] || [self.pwdTextField.text isEqualToString:@""]) {
        self.submitBtn.enabled = NO;
        self.submitBtn.alpha = 0.3;
    } else {
        self.submitBtn.enabled = YES;
        self.submitBtn.alpha = 1;
    }
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
    }  else if (textField == self.pwdTextField) {
        BOOL isLettersOrNumber = [string isLettersOrNumbers];
        if (!isLettersOrNumber) {
            return NO;
        }
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
