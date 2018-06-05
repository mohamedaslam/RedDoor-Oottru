//
//  UserModel.h
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SexType) {
    SexType_Man = 0,//男
    SexType_Woman,//女
};

@interface UserModel : NSObject

/** 用户ID */
@property (nonatomic, assign) int32_t userId;
/** 用户手机号 */
@property (nonatomic, strong) NSString *userName;
/** 用户头像 */
@property (nonatomic, strong) NSString *avatarStr;
/** 用户昵称 */
@property (nonatomic, strong) NSString *nickName;
/** 用户性别 */
@property (nonatomic, assign) SexType sexType;
/** 用户地区 */
@property (nonatomic, strong) NSString *location;

@end
