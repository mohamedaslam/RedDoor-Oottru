//
//  SettingTableViewCell.h
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 副标题 */
@property (nonatomic, strong) UILabel *subTitleLabel;
/** 下一级标识 */
@property (nonatomic, strong) UIImageView *nextImageView;
/** 退出账号 */
@property (nonatomic, strong) UILabel *quitLabel;

@end
