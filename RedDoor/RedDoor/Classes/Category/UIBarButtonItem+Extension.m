//
//  UIBarButtonItem+Extension.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/2.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setImage:image forState:UIControlStateNormal];
    //设置尺寸
    btn.frame = CGRectMake(0, 0, ITNavigationBarBtnWH, ITNavigationBarBtnWH);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action headIconImageStr:(NSString *)headIconImageStr placeholderImage:(UIImage *)placeholderImage {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 针对iOS 11处理
    NSLayoutConstraint *widthAnchor = [btn.widthAnchor constraintEqualToConstant:ITNavigationBarBtnWH];
    NSLayoutConstraint *heightAnchor = [btn.heightAnchor constraintEqualToConstant:ITNavigationBarBtnWH];
    
    widthAnchor.active = YES;
    heightAnchor.active = YES;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置btn尺寸
    btn.frame = CGRectMake(0, 0, ITNavigationBarBtnWH, ITNavigationBarBtnWH);
    // 设置图片内边距
    btn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    // 设置imageview圆角
    btn.imageView.layer.cornerRadius = (ITNavigationBarBtnWH-5*2)/2;
    // 设置图片
    [btn setImage:placeholderImage forState:UIControlStateNormal];
    // 设置btn圆角
    btn.layer.cornerRadius = ITNavigationBarBtnWH/2;
    
    //加载图片
    btn.imageView.image = placeholderImage;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = titleFont;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    CGSize btnSize = [btn.titleLabel.text sizeWithFont:btn.titleLabel.font];
    btn.frame = CGRectMake(0, 0, btnSize.width, btnSize.height);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
