//
//  CRPlainButton.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRPlainButton.h"
#import "UIImage+CRAdd.h"

@interface CRPlainButton ()

@property (nonatomic, assign) CRPlainButtonType plainType;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, assign) CGColorRef borderColor;

@property (nonatomic, strong) UIColor *backgroundColorNormal;
@property (nonatomic, strong) UIColor *backgroundColorHighlighted;

@property (nonatomic, strong) UIColor *titleColorNormal;
@property (nonatomic, strong) UIColor *titleColorHighlighted;
@property (nonatomic, strong) UIColor *titleColorDisabled;

@end

@implementation CRPlainButton (CRTheme)

#pragma mark - Init For Theme
+ (instancetype)roundButtonDefaultWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title {
    return [self roundButtonDefaultWithPlainType:plainType
                                           title:title
                                            font:TM_Font_BtnText];
}

+ (instancetype)roundButtonDefaultWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title
                                           font:(UIFont *)font {
    UIColor *colorNormal = nil;
    UIColor *colorHighlighted = nil;
    UIColor *colorDisabled = nil;
    switch (plainType) {
        case CRPlainButtonTypeCustom:
        case CRPlainButtonTypeBackground:
        {
            colorNormal =       TM_Color_ControlStateNor_Blue;
            colorHighlighted =  TM_Color_ControlStateSel_Blue;
            colorDisabled =     TM_Color_ControlStateDis_Blue;
            break;
        }
        case CRPlainButtonTypeTitle:
        {
            colorNormal =       TM_Color_ControlStateNor_Blue;
            colorHighlighted =  TM_Color_ControlStateSel_Blue;
            colorDisabled =     TM_Color_ControlStateDis_Gray;
            break;
        }
        case CRPlainButtonTypeBorder:
        {
            colorNormal =       TM_Color_ControlStateNor_Blue;
            colorHighlighted =  TM_Color_ControlStateSel_Blue;
            colorDisabled =     TM_Color_ControlStateDis_Gray;
            break;
        }
    }
    return [self roundButtonWithPlainType:plainType
                                    title:title
                                     font:font
                              colorNormal:colorNormal
                         colorHighlighted:colorHighlighted
                            colorDisabled:colorDisabled];
}

+ (instancetype)roundButtonWarningWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title {
    return [self roundButtonWarningWithPlainType:plainType
                                           title:title
                                            font:TM_Font_BtnText];
}

+ (instancetype)roundButtonWarningWithPlainType:(CRPlainButtonType)plainType
                                          title:(NSString *)title
                                           font:(UIFont *)font {
    UIColor *colorNormal = nil;
    UIColor *colorHighlighted = nil;
    UIColor *colorDisabled = nil;
    switch (plainType) {
        case CRPlainButtonTypeCustom:
        case CRPlainButtonTypeBackground:
        {
            colorNormal =       TM_Color_ControlStateNor_Red;
            colorHighlighted =  TM_Color_ControlStateSel_Red;
            colorDisabled =     TM_Color_ControlStateDis_Red;
            break;
        }
        case CRPlainButtonTypeTitle:
        {
            colorNormal =       TM_Color_ControlStateNor_Red;
            colorHighlighted =  TM_Color_ControlStateSel_Red;
            colorDisabled =     TM_Color_ControlStateDis_Gray;
            break;
        }
        case CRPlainButtonTypeBorder:
        {
            colorNormal =       TM_Color_ControlStateNor_Red;
            colorHighlighted =  TM_Color_ControlStateSel_Red;
            colorDisabled =     TM_Color_ControlStateDis_Gray;
            break;
        }
    }
    return [self roundButtonWithPlainType:plainType
                                    title:title
                                     font:font
                              colorNormal:colorNormal
                         colorHighlighted:colorHighlighted
                            colorDisabled:colorDisabled];
}

+ (instancetype)roundButtonWithPlainType:(CRPlainButtonType)plainType
                                   title:(NSString *)title
                                    font:(UIFont *)font
                             colorNormal:(UIColor *)colorNormal
                        colorHighlighted:(UIColor *)colorHighlighted
                           colorDisabled:(UIColor *)colorDisabled {
    UIColor *titleColorNor = nil;
    UIColor *titleColorHig = nil;
    UIColor *titleColorDis = nil;
    UIColor *bgColorNor = nil;
    UIColor *bgColorHig = nil;
    UIColor *bgColorDis = nil;
    switch (plainType) {
        case CRPlainButtonTypeCustom:
        case CRPlainButtonTypeBackground:
        {
            titleColorNor = TM_Color_ControlStateNor_White;
            titleColorHig = TM_Color_ControlStateSel_White;
            titleColorDis = TM_Color_ControlStateDis_White;
            bgColorNor = colorNormal;
            bgColorHig = colorHighlighted;
            bgColorDis = colorDisabled;
            break;
        }
        case CRPlainButtonTypeTitle:
        case CRPlainButtonTypeBorder:
        {
            titleColorNor = colorNormal;
            titleColorHig = colorHighlighted;
            titleColorDis = colorDisabled;
            break;
        }
    }
    BOOL showBorder = plainType == CRPlainButtonTypeBorder;
    return [self roundButtonWithTitle:title
                                 font:font
                            plainType:plainType
                     titleColorNormal:titleColorNor
                titleColorHighlighted:titleColorHig
                   titleColorDisabled:titleColorDis
                        bgColorNormal:bgColorNor
                   bgColorHighlighted:bgColorHig
                      bgColorDisabled:bgColorDis
                           showBorder:showBorder];
}

@end

@implementation CRPlainButton

#pragma mark - Init
+ (instancetype)roundButtonWithTitle:(NSString *)title
                                font:(UIFont *)font
                    titleColorNormal:(UIColor *)titleColorNormal
               titleColorHighlighted:(UIColor *)titleColorHighlighted
                       bgColorNormal:(UIColor *)bgColorNormal
                  bgColorHighlighted:(UIColor *)bgColorHighlighted
                          showBorder:(BOOL)showBorder {
    return [self roundButtonWithTitle:title
                                 font:font
                            plainType:CRPlainButtonTypeCustom
                     titleColorNormal:titleColorNormal
                titleColorHighlighted:titleColorHighlighted
                   titleColorDisabled:nil
                        bgColorNormal:bgColorNormal
                   bgColorHighlighted:bgColorHighlighted
                      bgColorDisabled:nil
                           showBorder:showBorder];
}

+ (instancetype)roundButtonWithTitle:(NSString *)title
                                font:(UIFont *)font
                           plainType:(CRPlainButtonType)plainType
                    titleColorNormal:(UIColor *)titleColorNormal
               titleColorHighlighted:(UIColor *)titleColorHighlighted
                  titleColorDisabled:(UIColor *)titleColorDisabled
                       bgColorNormal:(UIColor *)bgColorNormal
                  bgColorHighlighted:(UIColor *)bgColorHighlighted
                     bgColorDisabled:(UIColor *)bgColorDisabled
                          showBorder:(BOOL)showBorder {
    CRPlainButton *button = [[CRPlainButton alloc] initWithTitle:title
                                                              font:font
                                                         plainType:plainType
                                                  titleColorNormal:titleColorNormal
                                             titleColorHighlighted:titleColorHighlighted
                                                titleColorDisabled:titleColorDisabled
                                                     bgColorNormal:bgColorNormal
                                                bgColorHighlighted:bgColorHighlighted
                                                   bgColorDisabled:bgColorDisabled
                                                        showBorder:showBorder];
    return button;
}

// 完整Init
- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
                    plainType:(CRPlainButtonType)plainType
             titleColorNormal:(UIColor *)titleColorNormal
        titleColorHighlighted:(UIColor *)titleColorHighlighted
           titleColorDisabled:(UIColor *)titleColorDisabled
                bgColorNormal:(UIColor *)bgColorNormal
           bgColorHighlighted:(UIColor *)bgColorHighlighted
              bgColorDisabled:(UIColor *)bgColorDisabled
                   showBorder:(BOOL)showBorder
{
    self = [super init];
    if (self) {
        self.plainType = plainType;
        if (plainType != CRPlainButtonTypeTitle) {
            self.layer.masksToBounds = YES;
            self.layer.cornerRadius = TC_ButtonRadius;
        }
        self.titleColorNormal = titleColorNormal;
        self.titleColorHighlighted = titleColorHighlighted;
        self.titleColorDisabled = titleColorDisabled;
        [self setTitleFont:font];
        [self setShowBorder:showBorder];
        if (showBorder) {
            self.borderColor = titleColorNormal.CGColor;
        }
        self.backgroundColorNormal = bgColorNormal;
        self.backgroundColorHighlighted = bgColorHighlighted;
        [self setBackgroundColor:bgColorNormal];
        UIControlEvents eventsNormal = UIControlEventTouchUpInside|UIControlEventTouchDragExit;
        [self addTarget:self action:@selector(updateBackgroundColorNormal:) forControlEvents:eventsNormal];
        UIControlEvents eventsHighlighted = UIControlEventTouchDown|UIControlEventTouchDragEnter;
        [self addTarget:self action:@selector(updateBackgroundColorHighlighted:) forControlEvents:eventsHighlighted];
        [self setBackgroundImage:[UIImage imageWithColor:bgColorDisabled] forState:UIControlStateDisabled];
        
        [self setTitle:title];
        
//        [self setBackgroundImage:[UIImage imageWithColor:bgColorNormal] forState:UIControlStateNormal];
//        [self setBackgroundImage:[UIImage imageWithColor:bgColorHighlighted] forState:UIControlStateHighlighted];
        
    }
    return self;
}

#pragma mark - Title

- (void)setTitle:(NSString *)title {
    if (title.length == 0) {
        title = @"";
    }
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitle:title forState:UIControlStateDisabled];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    UIColor *titleColor = nil;
    if (self.titleColorNormal) {
        titleColor = self.titleColorNormal;
    }
    if (self.titleColorHighlighted && (state & UIControlStateHighlighted)) {
        titleColor = self.titleColorHighlighted;
    }
    if (self.titleColorDisabled && (state & UIControlStateDisabled)) {
        titleColor = self.titleColorDisabled;
    }
    if (titleColor) {
        NSDictionary *attributes = @{
                                     NSFontAttributeName : self.titleFont,
                                     NSForegroundColorAttributeName : titleColor
                                     };
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title
                                                                              attributes:attributes];
        [super setAttributedTitle:attributedTitle forState:state];
    } else {
        [super setTitle:title forState:state];
    }
}

#pragma mark - Background
- (void)updateBackgroundColorNormal:(UIButton *)sender {
    if (self.backgroundColorNormal) {
        self.backgroundColor = self.backgroundColorNormal;
    }
}

- (void)updateBackgroundColorHighlighted:(UIButton *)sender {
    if (self.backgroundColorHighlighted) {
        self.backgroundColor = self.backgroundColorHighlighted;
    }
}

#pragma mark - Border
- (void)setShowBorder:(BOOL)showBorder {
    _showBorder = showBorder;
    if (showBorder) {
        self.layer.borderWidth = 1.0;
    } else {
        self.layer.borderWidth = 0.f;
    }
}

- (void)setBorderColor:(CGColorRef)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateCurrentBorderColorByIsEnabled:enabled isHighlighted:self.highlighted];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateCurrentBorderColorByIsEnabled:self.enabled isHighlighted:highlighted];
}

- (void)updateCurrentBorderColorByIsEnabled:(BOOL)enabled isHighlighted:(BOOL)highlighted {
    if (!self.showBorder) {
        return;
    }
    UIColor *borderColor = self.titleColorNormal;
    if (highlighted) {
        borderColor = self.titleColorHighlighted;
    }
    if (!enabled) {
        borderColor = self.titleColorDisabled;
    }
    self.borderColor = borderColor.CGColor;
}

#pragma mark - Other Setter
- (void)setTitleFont:(UIFont *)titleFont {
    if (!titleFont) {
        titleFont = TM_Font_BtnText;
    }
    _titleFont = titleFont;
}

@end
