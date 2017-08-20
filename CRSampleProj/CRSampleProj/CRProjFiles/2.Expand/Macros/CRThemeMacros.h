//
//  CRThemeMacros.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

/*! @brief 项目工程的主题配置
 *
 * mT_前缀    只在本文件中使用的工具宏(请勿外部使用) [ MacrosTools -> mT_ ]
 * TM_前缀    主题相关的宏定义 [ ThemeMacros -> TM_ ]
 * 主题范围:
 * 颜色、字体、常量数值。
 */
#import <UIKit/UIKit.h>

/** --------- **/
#pragma mark - <Theme Color>
/// Color

#define TM_Color_ThemeMain          mT_Color_RGB( 92, 138, 223) //#5C8ADF
#define TM_Color_White              mT_Color_RGB(255, 255, 255) //#FFFFFF
#define TM_Color_WarningRed         mT_Color_RGB(218,  82,  82)

#define TM_Color_PlusPoint          mT_Color_RGB(115, 189, 245) //#73BDF5
#define TM_Color_MinusPoint         mT_Color_RGB(237, 103, 103) //#ED6767
#define TM_Color_BarTint_Gray       mT_Color_RGB(244, 245, 246) //#F4F5F6
#define TM_Color_Backgound_White    mT_Color_RGB(255, 255, 255) //#FFFFFF
#define TM_Color_Backgound_Gray     mT_Color_RGB(235, 239, 243) //#EBEFF3
#define TM_Color_SeparatorLine      mT_Color_RGB(229, 230, 232) //#E5E6E8
#define TM_Color_ScreenMask         mT_Color_WhiteA(0.0, 0.4)

#define TM_Color_Cell_Nor           mT_Color_RGB(252, 252, 252) //#FCFCFC
#define TM_Color_Cell_Hig           mT_Color_RGB(231, 232, 232) //#E7E8E8

#define TM_Color_Card_Nor           mT_Color_RGB(252, 252, 252) // WaitToDelete
#define TM_Color_Card_Hig           mT_Color_RGB(231, 232, 232) // WaitToDelete
#define TM_Color_Card_Sel           mT_Color_RGB(231, 232, 232) // WaitToDelete

/// ControlState
#define TM_Color_ControlStateNor_Blue     TM_Color_ThemeMain
#define TM_Color_ControlStateSel_Blue     mT_Color_RGB(154, 182, 233) //#9AB6E9
#define TM_Color_ControlStateDis_Blue     TM_Color_ControlStateNor_Blue

#define TM_Color_ControlStateNor_White    mT_Color_RGB(255, 255, 255) //#FFFFFF
#define TM_Color_ControlStateSel_White    TM_Color_ControlStateNor_White
#define TM_Color_ControlStateDis_White    mT_Color_WhiteA(1.0, 0.5)

#define TM_Color_ControlStateNor_Gray     mT_Color_RGB(102, 102, 102) //#666666
#define TM_Color_ControlStateSel_Gray     TM_Color_ControlStateNor_Gray
#define TM_Color_ControlStateDis_Gray     mT_Color_RGBA(102, 102, 102, 0.5)

#define TM_Color_ControlStateNor_Red      TM_Color_WarningRed
#define TM_Color_ControlStateSel_Red      mT_Color_RGB(190,  54,  54)
#define TM_Color_ControlStateDis_Red      TM_Color_ControlStateNor_Red

#define TM_Color_TextPlaceholder    mT_Color_RGB(193, 193, 193) //#C1C1C1
#define TM_Color_TextLv1            mT_Color_RGB( 51,  51,  51) //#333333
#define TM_Color_TextLv2            mT_Color_RGB(102, 102, 102) //#666666
#define TM_Color_TextLv3            mT_Color_RGB(136, 136, 136) //
#define TM_Color_TextLv3_Gray       mT_Color_RGB( 51,  51,  51) //#333333
#define TM_Color_TextLv4            mT_Color_RGB(153, 153, 153) //#999999

/** --------- **/
#pragma mark - <Theme Font>
/// Font

#define TM_Font_NavTitle            TM_BoldFont(18)
#define TM_Font_NavText             TM_MainFont(16)
#define TM_Font_BtnText             TM_BoldFont(16)

#define TM_Font_TextLv1             TM_MainFont(16)
#define TM_Font_TextLv2             TM_MainFont(16)
#define TM_Font_TextLv3             TM_MainFont(14)
#define TM_Font_TextLv4             TM_MainFont(12)

#define TM_MainFont(x)              mT_Font_Sysm(x)
#define TM_BoldFont(x)              mT_Font_BoldSysm(x)
//// Font Substitution
//#define TM_FontName_HelveticaNeueLight      (@"HelveticaNeue-Light")
//#define TM_FontName_HelveticaNeueRegular    (@"HelveticaNeue")
//
//#define TM_FontName_Chinese         (@"Heiti SC")
//#define TM_FontName_Monospaced      (@"HelveticaNeue")
////常见等宽字体:HelveticaNeue Thonburi Courier
//#define TM_Font_Chinese(x)          mT_Font(TM_FontName_Chinese, x)
#define TM_Font_Monospaced(x)       mT_Font(@"HelveticaNeue", x)
#define TM_Font_Monospaced_Bold(x)  mT_Font(@"HelveticaNeue-Bold", x)
//#define TM_Font_MainFont(x)         TM_Font_Monospaced(x)

/** --------- **/
#pragma mark - <Tools For This Header File>
/// MacrosTools
#define mT_Font(name,x)          ([UIFont fontWithName:(name) size:(x)])
#define mT_Font_Sysm(x)          ([UIFont systemFontOfSize:x])
#define mT_Font_BoldSysm(x)      ([UIFont boldSystemFontOfSize:x])
#define mT_Color_WhiteA(w,a)     ([UIColor colorWithWhite:w alpha:a])
#define mT_Color_RGB(r,g,b)      (Color_RGBA(r,g,b,1.0f))
#define mT_Color_RGBA(r,g,b,a)   ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)])
#define mT_Color_Hex(hex)        (Color_HexA(hex,1.0f))
#define mT_Color_HexA(hex,a)     ([UIColor colorWithRed:((CGFloat)((hex & 0xFF0000) >> 16))/255.0f \
green:((CGFloat)((hex & 0xFF00) >> 8))/255.0f \
blue:((CGFloat)(hex & 0xFF))/255.0f alpha:(a)])
