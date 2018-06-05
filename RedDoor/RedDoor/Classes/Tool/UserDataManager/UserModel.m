//
//  UserModel.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userId = 0;
        self.userName = @"";
        self.avatarStr = @"";
        self.nickName = @"";
        self.sexType = SexType_Man;
        self.location = @"";
    }
    return self;
}

@end
