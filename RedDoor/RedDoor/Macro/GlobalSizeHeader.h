//
//  GlobalSizeHeader.h
//  RedDoor
//
//  Created by HuangQianwei on 2018/6/1.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#ifndef GlobalSizeHeader_h
#define GlobalSizeHeader_h

#define IPHONE_4_0_INCH_WIDTH 320.0
#define IPHONE_4_0_INCH_HEIGHT 568.0
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define AutoSizeScaleX SCREEN_WIDTH/IPHONE_4_0_INCH_WIDTH
#define AutoSizeScaleY SCREEN_HEIGHT/IPHONE_4_0_INCH_HEIGHT

#define ITNavigationBarMinY 20
#define ITNavigationBarMaxY 64
#define ITNavigationBarBtnWH 44
#define ITNavigationBarTitleViewH 44

#endif /* GlobalSizeHeader_h */
