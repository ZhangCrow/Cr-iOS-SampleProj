//
//  CRPlainButton.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import <UIKit/UIKit.h>

//CRPlainButton
typedef NS_ENUM(NSInteger, CRPlainButtonType) {
    CRPlainButtonTypeCustom = 0,
    CRPlainButtonTypeTitle,
    CRPlainButtonTypeBorder,
    CRPlainButtonTypeBackground,
};

/*! @brief 纯文本按钮 (普通/圆角背景/圆角轮廓 三种样式)
 */
@interface CRPlainButton : UIButton

@property (nonatomic, assign) BOOL showBorder;
@property (nonatomic, copy) NSString *title;

+ (instancetype)roundButtonWithTitle:(NSString *)title
                                font:(UIFont *)font
                    titleColorNormal:(UIColor *)titleColorNormal
               titleColorHighlighted:(UIColor *)titleColorHighlighted
                       bgColorNormal:(UIColor *)bgColorNormal
                  bgColorHighlighted:(UIColor *)bgColorHighlighted
                          showBorder:(BOOL)showBorder;

+ (instancetype)roundButtonWithTitle:(NSString *)title
                                font:(UIFont *)font
                           plainType:(CRPlainButtonType)plainType
                    titleColorNormal:(UIColor *)titleColorNormal
               titleColorHighlighted:(UIColor *)titleColorHighlighted
                  titleColorDisabled:(UIColor *)titleColorDisabled
                       bgColorNormal:(UIColor *)bgColorNormal
                  bgColorHighlighted:(UIColor *)bgColorHighlighted
                     bgColorDisabled:(UIColor *)bgColorDisabled
                          showBorder:(BOOL)showBorder;

- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
                    plainType:(CRPlainButtonType)plainType
             titleColorNormal:(UIColor *)titleColorNormal
        titleColorHighlighted:(UIColor *)titleColorHighlighted
           titleColorDisabled:(UIColor *)titleColorDisabled
                bgColorNormal:(UIColor *)bgColorNormal
           bgColorHighlighted:(UIColor *)bgColorHighlighted
              bgColorDisabled:(UIColor *)bgColorDisabled
                   showBorder:(BOOL)showBorder;
@end

@interface CRPlainButton (CRTheme)

+ (instancetype)roundButtonDefaultWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title;

+ (instancetype)roundButtonDefaultWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title
                                           font:(UIFont *)font;

+ (instancetype)roundButtonWarningWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title;

+ (instancetype)roundButtonWarningWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title
                                           font:(UIFont *)font;

+ (instancetype)roundButtonWithPlainType:(CRPlainButtonType)plainType
                                   title:(NSString *)title
                                    font:(UIFont *)font
                             colorNormal:(UIColor *)colorNormal
                        colorHighlighted:(UIColor *)colorHighlighted
                           colorDisabled:(UIColor *)colorDisabled;

@end
