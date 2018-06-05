//
//  NSString+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font {
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

//获取当前时间 YYYY-MM-dd hh:mm
+ (NSString *)stringGetCurrentTime {
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}

//判断是否为手机号
- (BOOL)isPhoneNumber {
    if (self.length != 11) {
        return NO;
    }
    return [[NSRegularExpression regularExpressionWithPattern:@"^1[34578]\\d{9}$" options:0 error:nil] matchesInString:self options:0 range:NSMakeRange(0, self.length)].count;
}

//判断字符串是否由数字组成
- (BOOL)isNumbers {
    NSString *numString = @"[0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numString];
    BOOL inputString = [predicate evaluateWithObject:self];
    return inputString;
}

//判断字符串是否由字母组成
- (BOOL)isLetters {
    NSString *letterString = @"[a-zA-Z]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",letterString];
    BOOL inputString = [predicate evaluateWithObject:self];
    return inputString;
}

//判断字符串是否由字母、数字组成
- (BOOL)isLettersOrNumbers {
    NSString *regex =@"[a-zA-Z0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL inputString = [predicate evaluateWithObject:self];
    return inputString;
}

//判断字符串是否由汉字、字母、数字组成
- (BOOL)isChineseLettersOrNumbers {
    NSString *regex =@"[\u4e00-\u9fa5a-zA-Z0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL inputString = [predicate evaluateWithObject:self];
    return inputString;
}

@end
