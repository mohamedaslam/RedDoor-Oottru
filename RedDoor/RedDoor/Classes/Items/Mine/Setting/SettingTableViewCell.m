//
//  SettingTableViewCell.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/3.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        [self configView];
    }
    return self;
}

- (void)configView {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = ICColorOfText_DarkGray;
    titleLabel.font = ICFontOfTitle_Chinese_14;
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.textColor = ICColorOfText_Gray;
    subTitleLabel.font = ICFontOfTitle_Chinese_14;
    [self.contentView addSubview:subTitleLabel];
    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(- 15 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
    }];
    self.subTitleLabel = subTitleLabel;
    
    UIImageView *nextImageView = [[UIImageView alloc] init];
    nextImageView.image = [UIImage imageNamed:@"mine_personinfo_next"];
    [self.contentView addSubview:nextImageView];
    [nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(- 9 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(18 * AutoSizeScaleX);
    }];
    self.nextImageView = nextImageView;
    
    UILabel *quitLabel = [[UILabel alloc] init];
    quitLabel.text = @"退出账号";
    quitLabel.textColor = ICColorOfText_LightRed;
    quitLabel.font = ICFontOfTitle_Chinese_14;
    [self.contentView addSubview:quitLabel];
    [quitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    self.quitLabel = quitLabel;
}

@end
