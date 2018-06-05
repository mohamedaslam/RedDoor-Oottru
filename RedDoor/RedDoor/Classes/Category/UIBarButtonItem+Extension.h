//
//  UIBarButtonItem+Extension.h
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/2.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action headIconImageStr:(NSString *)headIconImageStr placeholderImage:(UIImage *)placeholderImage;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor;

@end
