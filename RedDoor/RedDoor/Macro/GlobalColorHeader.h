//
//  GlobalColorHeader.h
//  RedDoor
//
//  Created by HuangQianwei on 2018/5/31.
//  Copyright © 2018年 QianWei Huang. All rights reserved.
//

#ifndef GlobalColorHeader_h
#define GlobalColorHeader_h

#define ITRGBColor(R,G,B,ALPHA) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(ALPHA)]
#define ITHexColor(HexString,ALPHA) [UIColor hx_colorWithHexRGBAString:(HexString) alpha:(ALPHA)]
#define ITRandomColor ITRGBColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256),1)

//BackgroundColor
#define ICColorOfBackground_White       ITHexColor(@"#ffffff",1)
#define ICColorOfBackground_LightGray   ITHexColor(@"#f6f6f6",1)
#define ICColorOfBackground_Red         ITHexColor(@"#cf261d",1)
#define ICColorOfBackground_Black       ITHexColor(@"#000000",1)

//TextColor
#define ICColorOfText_White        ITHexColor(@"#ffffff",1)
#define ICColorOfText_LightRed     ITHexColor(@"#f25241",1)
#define ICColorOfText_Red          ITHexColor(@"#cf261d",1)
#define ICColorOfText_LightGray    ITHexColor(@"#bbbbbb",1)
#define ICColorOfText_Gray         ITHexColor(@"#999999",1)
#define ICColorOfText_DarkGray     ITHexColor(@"#333333",1)
#define ICColorOfText_Black        ITHexColor(@"#000000",1)

//BorderColor
#define ICColorOfBorder_White       ITHexColor(@"#ffffff",1)
#define ICColorOfBorder_LightGray   ITHexColor(@"#eeeeee",1)
#define ICColorOfBorder_Gray        ITHexColor(@"#cccccc",1)

#endif /* GlobalColorHeader_h */
