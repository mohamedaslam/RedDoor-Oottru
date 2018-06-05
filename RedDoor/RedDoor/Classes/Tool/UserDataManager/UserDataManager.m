//
//  UserDataManager.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/5/31.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "UserDataManager.h"
#import "AFNetworking.h"

#import "UserModel.h"

@implementation UserDataManager

+ (instancetype)sharedInstance {
    static dispatch_once_t __singletonToken;
    static UserDataManager *__singleton__;
    dispatch_once( &__singletonToken, ^{
        __singleton__ = [[self alloc] init];
    } );
    return __singleton__;
}

- (void)requestLoginByUserName:(NSString *)userName password:(NSString *)password complete:(void(^)(BOOL isSuccess, NSString *resultInfoStr))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *pwdBase64Str = [ITEncryption fetchBase64StringWithString:password];
    NSDictionary *dict = @{
                           @"UserName":userName,
                           @"PassWord":pwdBase64Str,
                           };
    
    [manager POST:@"https://hongmen.memobird.cn/Home/LoginSubmit" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BOOL isSuccess = [[responseObject valueForKey:@"IsSuccess"] boolValue];
        if (isSuccess) {
            self.currentUser.userId = [[[responseObject valueForKey:@"ResultInfo"] valueForKey:@"UserID"] intValue];
            completeBlock(YES,@"登录成功");
        } else {
            NSString *resultInfoStr = [responseObject valueForKey:@"ResultInfo"];
            completeBlock(NO,resultInfoStr);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(NO, @"登录请求失败");
    }];
}

- (void)requestRegisterByUserName:(NSString *)userName password:(NSString *)password nickName:(NSString *)nickName complete:(void(^)(BOOL isSuccess, NSString *resultInfo))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *pwdBase64Str = [ITEncryption fetchBase64StringWithString:password];
    NSDictionary *dict = @{
                           @"UserName":userName,
                           @"PassWord":pwdBase64Str,
                           @"NickName":nickName,
                           };
    
    [manager POST:@"https://hongmen.memobird.cn/Home/RegisterSubmit" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BOOL isSuccess = [[responseObject valueForKey:@"IsSuccess"] boolValue];
        NSString *resultInfo = [responseObject valueForKey:@"ResultInfo"];
        
        completeBlock(isSuccess, resultInfo);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(NO, @"注册请求失败");
    }];
}

- (void)requestResetPasswordByUserName:(NSString *)userName password:(NSString *)password confirmPassword:(NSString *)confirmPassword complete:(void(^)(BOOL isSuccess, NSString *resultInfo))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *pwdBase64Str = [ITEncryption fetchBase64StringWithString:password];
    NSString *confirmPwdBase64Str = [ITEncryption fetchBase64StringWithString:confirmPassword];
    NSDictionary *dict = @{
                           @"UserName":userName,
                           @"PassWord":pwdBase64Str,
                           @"ConfirmPassword":confirmPwdBase64Str,
                           };

    [manager POST:@"https://hongmen.memobird.cn/Home/ResetPassword" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BOOL isSuccess = [[responseObject valueForKey:@"IsSuccess"] boolValue];
        NSString *resultInfo = [responseObject valueForKey:@"ResultInfo"];
        
        completeBlock(isSuccess, resultInfo);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(NO, nil);
    }];
}

- (void)requestRetrievePasswordByUserName:(NSString *)userName confirmPassword:(NSString *)confirmPassword complete:(void(^)(BOOL isSuccess, NSString *resultInfo))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *confirmPwdBase64Str = [ITEncryption fetchBase64StringWithString:confirmPassword];
    NSDictionary *dict = @{
                           @"UserName":userName,
                           @"ConfirmPassword":confirmPwdBase64Str,
                           };
    
    [manager POST:@"https://hongmen.memobird.cn/Home/RetrievePassword" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BOOL isSuccess = [[responseObject valueForKey:@"IsSuccess"] boolValue];
        NSString *resultInfo = [responseObject valueForKey:@"ResultInfo"];
        
        completeBlock(isSuccess, resultInfo);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(NO, nil);
    }];
}

- (void)requestGetUserInfoByUserId:(int32_t)userId {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *dict = @{
                           @"UserID":[NSNumber numberWithInt:userId],
                           };
    
    [manager POST:@"https://hongmen.memobird.cn/Home/GetUserInfo" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        int i = 0;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        int i = 0;
    }];
}

#pragma mark - Getter
- (UserModel *)currentUser {
    if (_currentUser == nil) {
        _currentUser = [[UserModel alloc] init];
    }
    return _currentUser;
}


@end
