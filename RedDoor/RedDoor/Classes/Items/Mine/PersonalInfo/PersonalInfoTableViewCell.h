//
//  PersonalInfoTableViewCell.h
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/4.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoTableViewCell : UITableViewCell

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 下一级标识 */
@property (nonatomic, strong) UIImageView *nextImageView;
/** 头像 */
@property (nonatomic, strong) UIImageView *headIconImageView;
/** 副标题 */
@property (nonatomic, strong) UILabel *subTitleLabel;
/** 图标 */
@property (nonatomic, strong) UIImageView *subImageView;
/** 账号 */
@property (nonatomic, strong) UILabel *accountLabel;

@end
