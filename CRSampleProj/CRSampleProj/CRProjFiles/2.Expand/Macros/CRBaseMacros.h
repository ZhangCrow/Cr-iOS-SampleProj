//
//  CRBaseMacros.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

/*! @brief 常见的配置项
 *
 * mT_前缀    只在本文件中使用的工具宏(请勿外部使用) [ MacrosTools -> mT_ ]
 * 其他       外部可用的宏定义
 *
 */
#import <UIKit/UIKit.h>

#pragma mark - <Debug Switch>
/// Debug Switch
#warning DebugMode_Dev is On
#define DebugMode_Dev

#pragma mark - <Screen Length>
/// Screen Length
#define ScreenBounds            ([[UIScreen mainScreen] bounds])
#define ScreenWidth             (ScreenBounds.size.width)
#define ScreenHeight            (ScreenBounds.size.height)
#define AppFrame                ([[UIScreen mainScreen] applicationFrame])
#define AppWidth                (AppFrame.size.width)
#define AppHeight               (AppFrame.size.height)
//不同屏幕尺寸字体适配（默认效果图为iPhone6 如果不是则根据实际情况修改）
#define mT_ScreenWidthRatio     (ScreenWidth / CC_IPhone6Width)
#define mT_ScreenHeightRatio    (ScreenHeight / CC_IPhone6Height)
#define AdaptedWidth(x)         (ceilf((x) * mT_ScreenWidthRatio))
#define AdaptedHeight(x)        (ceilf((x) * mT_ScreenHeightRatio))

/** --------- **/
#pragma mark - <Font & Color & Image>
/// Font & Color
// Font
#define Font_Sysm(x)            ([UIFont systemFontOfSize:x])
#define Font_BoldSysm(x)        ([UIFont boldSystemFontOfSize:x])
#define Font(name,x)            ([UIFont fontWithName:(name) size:(x)])
#define AdaptedFontSize(x)      (AdaptedWidth(R))
// Color
#define Color_RGB(r,g,b)        (Color_RGBA(r,g,b,1.0f))
#define Color_RGBA(r,g,b,a)     ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)])
#define Color_Hex(hex)          (Color_HexA(hex,1.0f))
#define Color_HexA(hex,a)       ([UIColor colorWithRed:((CGFloat)((hex & 0xFF0000) >> 16))/255.0f green:((CGFloat)((hex & 0xFF00) >> 8))/255.0f blue:((CGFloat)(hex & 0xFF))/255.0f alpha:(a)])
#define Color_Alpha(color,a)    ([color colorWithAlphaComponent:a])
#define Color_Random            (Color_RGB(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256)))
// Image
#define Image_Name(name)        ([UIImage imageNamed:(name)])
#define Image_File(name, type)  ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(type)]])
/** --------- **/
#pragma mark - <Device & Version & App>
/// Device & Version
// 系统版本
#define SysmName            ([[UIDevice currentDevice] systemName])
#define SysmVersion_Float   ([[[UIDevice currentDevice] systemVersion] floatValue])
#define SysmVersion_Double  ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SysmVersion_String  ([[UIDevice currentDevice] systemVersion])
#define IOSx_orLater(x)     (SysmVersion_Float >= (x))
#define IOS10_orLater       (IOSx_orLater(10.0))
#define IOS9_orLater        (IOSx_orLater(9.0))
#define IOS8_orLater        (IOSx_orLater(8.0))
#define IOS7_orLater        (IOSx_orLater(7.0))
// 设备类型
#if TARGET_IPHONE_SIMULATOR
#define IsSimulator        (YES)   // Run on simulator.
#else
#define IsSimulator        (NO)    // Run on device.
#endif

#define IsPhone_Device      (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IsPad_Device        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsPod_Device        ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 设备型号
#define IsIPhone6P_Size     (ScreenWidth == CC_IPhonePWidth && ScreenHeight == CC_IPhonePHeight)
#define IsIPhone6_Size      (ScreenWidth == CC_IPhone6Width && ScreenHeight == CC_IPhone6Height)
#define IsIPhone5_Size      (ScreenWidth == CC_IPhone5Width && ScreenHeight == CC_IPhone5Height)
// 应用相关
#define App_ID              ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"])
#define App_Name            ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])
#define App_Version         ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define App_Build           ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

/** --------- **/
#pragma mark - <Develop Tools>
/// Develop Tools
// NSLog
#ifdef DEBUG
#define NSLog(s,...)        NSLog(@"<%@(%d)> %@",[[NSString stringWithUTF8String:__FILE__] lastPathComponent],\
__LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define                     NSDump(s) NSLog(@"%@", s)
#else
#define NSLog(s,...)
#define NSDump(s)
#endif

#ifdef DEBUG
#define IsDebugMode        (YES)   // Debug.
#else
#define IsDebugMode        (NO)    // Release.
#endif

#ifdef DebugMode_Dev
#define IsDebugMode_Dev        (YES)   // Debug_dev.
#else
#define IsDebugMode_Dev        (NO)    // notDebug_dev.
#endif

/** --------- **/
#pragma mark - <Speedy Macros>
/// Speedy Macros
// 常量 Constant

#define ScreenFrameExceptTopBar     ((CGRect){0, 0, ScreenWidth, ScreenHeight - CC_TopBarHeight})
#define ScreenFrameExceptTabBar     ((CGRect){0, 0, ScreenWidth, ScreenHeight - CC_TabBarHeight})
#define ScreenFrameExceptAllBar     ((CGRect){0, 0, ScreenWidth, ScreenHeight - CC_TopBarHeight - CC_TabBarHeight})

// 单例对象
#define kApplication                [UIApplication sharedApplication]
#define kAppDelegate                [[UIApplication sharedApplication] delegate]
#define kAppKeyWindow               [[UIApplication sharedApplication] keyWindow]
#define kUserDefaults               [NSUserDefaults standardUserDefaults]
#define kNotificationCenter         [NSNotificationCenter defaultCenter]

// 路径
// 获取temp
#define kPathTemp                   (NSTemporaryDirectory())
// 获取沙盒 Document
#define kPathDocument               ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject])
// 获取沙盒 Cache
#define kPathCache                  ([NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject])
// Library/Caches 文件路径
#define kPathLibrary                ([NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject])
//#define kFilePath                   ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])

// 获取当前语言
#define CurrentLanguage             ([[NSLocale preferredLanguages] objectAtIndex:0])

//// 判空
//// 是否为空 字符串
//#define IsEmpty_Str(_str)           (IsEmpty_Obj(_str) || [_str length] == 0)
//// 是否为空 数组
//#define IsEmpty_Arr(_arr)           (IsEmpty_Obj(_arr) || [_arr count] == 0)
//// 是否为空 字典
//#define IsEmpty_Dict(_dict)         (IsEmpty_Obj(_dict) || [[_dict allKeys] count] == 0)
//// 是否为空 对象
//#define IsEmpty_Obj(_obj)           (_obj == nil || [[NSNull null] isEqual:_obj])
//
//// 返回非空
//// 返回非空 字符串(Immutable)
//#define NonNull_Str(_str)           (IsEmpty_Str(_str) ? @"" : _str)
//// 返回非空 数组(Immutable)
//#define NonNull_Arr(_arr)           (IsEmpty_Arr(_arr) ? @[] : _arr)
//// 返回非空 字典(Immutable)
//#define NonNull_Dict(_dict)         (IsEmpty_Dict(_dict) ? @{} : _dict)
