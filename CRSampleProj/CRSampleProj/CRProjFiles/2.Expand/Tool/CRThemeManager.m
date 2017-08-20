//
//  CRThemeManager.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRThemeManager.h"
#import "UIImage+CRAdd.h"

@implementation CRThemeManager

+ (void)setup {
    // ThemeColor
    UIColor *themeColorNor = TM_Color_ThemeMain;
    UIColor *subthemeColorNor = TM_Color_White;
    
    // StatusBar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // NavBar
    [[UINavigationBar appearance] setTintColor:subthemeColorNor];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:themeColorNor]
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : subthemeColorNor,
                                                           NSFontAttributeName : TM_Font_NavTitle
                                                           }];
    // SearchBar
    Class searchBarClass = [UISearchBar class];
    NSDictionary *fontColorAttribute = @{NSForegroundColorAttributeName : subthemeColorNor};
    if (IOS9_orLater) {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[searchBarClass]] setTitleTextAttributes:fontColorAttribute forState:UIControlStateNormal];
    } else {
        [[UIBarButtonItem appearanceWhenContainedIn:searchBarClass, nil] setTitleTextAttributes:fontColorAttribute forState:UIControlStateNormal];
    }
    
    // TabBar
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:TM_Color_BarTint_Gray]];
}

@end
