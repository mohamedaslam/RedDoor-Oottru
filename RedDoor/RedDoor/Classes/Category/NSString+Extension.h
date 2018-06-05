//
//  NSString+Extension.h
//  黑马微博2期
//
//  Created by apple on 14-10-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Extension)

//根据font和maxW,计算string所占size
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

//根据font,计算string所占size
- (CGSize)sizeWithFont:(UIFont *)font;

//获取当前时间 YYYY-MM-dd hh:mm
+ (NSString *)stringGetCurrentTime;

//判断一个字符串是否是手机号码
- (BOOL)isPhoneNumber;

//判断一个字符串是否由数字组成
- (BOOL)isNumbers;

//判断一个字符串是否由字母组成
- (BOOL)isLetters;

//判断一个字符串是否由字母、数字组成
- (BOOL)isLettersOrNumbers;

//判断一个字符串是否由汉字、字母、数字组成
- (BOOL)isChineseLettersOrNumbers;

@end
