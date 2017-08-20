//
//  CRAppDelegate+Config.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRAppDelegate.h"

@interface CRAppDelegate (Config)

#pragma mark - 非控制器配置
/** 配置单例或全局组件 */
- (void)configSingleton;

#pragma mark - 控制器配置
/** 获取当前根控制器 */
- (UIViewController *)rootViewController;

/** 切换新的根控制器为TabBarVc */
- (void)showTabBarRootVcByCompletion:(void (^)(BOOL finished))completion;

@end
