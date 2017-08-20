//
//  CRNavigationController.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRNavigationController : UINavigationController

@property (nonatomic, assign) BOOL autoHidesTabBar;

/** 使一个控制器的手势回退失效 请在目标控制器的viewDidAppear:方法中 或在push目标控制器的方法前 调用  */
+ (void)makePopGestureRecognizerDisenableForViewController:(UIViewController *)viewController;

@end
