//
//  PersonalInfoTableViewCell.m
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/4.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#import "PersonalInfoTableViewCell.h"

@implementation PersonalInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        [self configView];
    }
    return self;
}

- (void)configView {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"标题";
    titleLabel.textColor = ICColorOfText_DarkGray;
    titleLabel.font = ICFontOfTitle_Chinese_14;
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
    }];
    self.titleLabel = titleLabel;
    
    UIImageView *nextImageView = [[UIImageView alloc] init];
    nextImageView.image = [UIImage imageNamed:@"mine_personinfo_next"];
    [self.contentView addSubview:nextImageView];
    [nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(- 9 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(18 * AutoSizeScaleX);
    }];
    self.nextImageView = nextImageView;
    
    UIImageView *headIconImageView = [[UIImageView alloc] init];
    headIconImageView.backgroundColor = [UIColor redColor];
    headIconImageView.layer.cornerRadius = 15.0 * AutoSizeScaleX;
    [self.contentView addSubview:headIconImageView];
    [headIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(nextImageView.mas_left).offset(- 4 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(30 * AutoSizeScaleX);
    }];
    self.headIconImageView = headIconImageView;
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.text = @"副标题";
    subTitleLabel.textColor = ICColorOfText_Gray;
    subTitleLabel.font = ICFontOfTitle_Chinese_12;
    [self.contentView addSubview:subTitleLabel];
    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(nextImageView.mas_left).offset(- 4 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
    }];
    self.subTitleLabel = subTitleLabel;
    
    UIImageView *subImageView = [[UIImageView alloc] init];
    subImageView.image = [UIImage imageNamed:@"mine_personinfo_woman"];
    [self.contentView addSubview:subImageView];
    [subImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(subTitleLabel.mas_left).offset(- 5 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(20 * AutoSizeScaleX);
    }];
    self.subImageView = subImageView;
    
    UILabel *accountLabel = [[UILabel alloc] init];
    accountLabel.text = @"15659430246";
    accountLabel.textColor = ICColorOfText_Gray;
    accountLabel.font = ICFontOfTitle_Chinese_12;
    [self.contentView addSubview:accountLabel];
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(- 15 * AutoSizeScaleX);
        make.centerY.equalTo(self.contentView);
    }];
    self.accountLabel = accountLabel;
}

@end
