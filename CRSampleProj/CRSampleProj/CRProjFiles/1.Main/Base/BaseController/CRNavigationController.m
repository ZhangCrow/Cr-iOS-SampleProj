//
//  CRNavigationController.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRNavigationController.h"

@interface CRNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL popGestureRecognizerDisenable;

@end

@implementation CRNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;
        _autoHidesTabBar = YES;
        _popGestureRecognizerDisenable = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TM_Color_Backgound_Gray;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    if (_autoHidesTabBar && [self.viewControllers count] == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL enabled = NO;
    if (_popGestureRecognizerDisenable || viewController == navigationController.viewControllers[0]) {
        _popGestureRecognizerDisenable = NO;
        enabled = NO;
    } else {
        enabled = YES;
    }
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = enabled;
    }
}

+ (void)makePopGestureRecognizerDisenableForViewController:(UIViewController *)viewController {
    if (![viewController.navigationController isKindOfClass:[self class]]) {
        return;
    }
    CRNavigationController *navC = (CRNavigationController *)viewController.navigationController;
    navC.popGestureRecognizerDisenable = YES;
}

@end
