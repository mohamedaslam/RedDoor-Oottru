//
//  UserDataManager.h
//  RedDoor
//
//  Created by HuangQianwei on 2018/5/31.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

@interface UserDataManager : NSObject

/** 用户信息 */
@property (nonatomic, strong) UserModel *currentUser;


+ (instancetype)sharedInstance;

/** 请求登录 */
- (void)requestLoginByUserName:(NSString *)userName password:(NSString *)password complete:(void(^)(BOOL isSuccess, NSString *resultInfoStr))completeBlock;

/** 请求注册 */
- (void)requestRegisterByUserName:(NSString *)userName password:(NSString *)password nickName:(NSString *)nickName complete:(void(^)(BOOL isSuccess, NSString *resultInfo))completeBlock;

/** 请求重置密码 */
- (void)requestResetPasswordByUserName:(NSString *)userName password:(NSString *)password confirmPassword:(NSString *)confirmPassword complete:(void(^)(BOOL isSuccess, NSString *resultInfo))completeBlock;

/** 请求找回密码 */
- (void)requestRetrievePasswordByUserName:(NSString *)userName confirmPassword:(NSString *)confirmPassword complete:(void(^)(BOOL isSuccess, NSString *resultInfo))completeBlock;

/** 请求用户信息 */
- (void)requestGetUserInfoByUserId:(int32_t)userId;

@end
