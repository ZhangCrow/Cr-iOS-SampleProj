//
//  CRAppDelegate+Config.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRAppDelegate+Config.h"

// ConfigSingleton
#import "CRThemeManager.h"
#import "CRCrashRecord.h"
#import "IQKeyboardManager.h"
#import "AvoidCrash.h"
#import <FHHFPSIndicator/FHHFPSIndicator.h>

// ConfigPage
#import "CRPartOneViewController.h"
#import "CRPartTwoViewController.h"
#import "CRPartThreeViewController.h"
#import "CRPartFourViewController.h"


static NSString *const kUserDefaultsKey_CrashMsgRecord = @"x_array_crashMsgRecord";

@implementation CRAppDelegate (Config)

#pragma mark - 非控制器配置
/** 配置单例或全局组件等 */
- (void)configSingleton {
    // 统计;主题;分享;路由;键盘等单例设置
    // 数据类型安全
    [AvoidCrash becomeEffective];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
    // 主题样式
    [CRThemeManager setup];
    // 键盘
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    // 帧率监测
    if (IsDebugMode_Dev) {
        FHHFPSIndicator *fps = [FHHFPSIndicator sharedFPSIndicator];
        [fps show];
        [fps fpsLabelColor:[UIColor blackColor]];
        fps.fpsLabelPosition = FPSIndicatorPositionTopRight;
    }
    [self commitCrashRecordToSeverIfNeeded];
    // 如有帐号 此处可检查登录状态 并监听帐号登录状态变更
    // 初始根控制器
    [self showTabBarRootVcByCompletion:nil];
}

/** AvoidCrash崩溃信息处理 */
- (void)dealwithCrashMessage:(NSNotification *)note {
    // 注意:所有的信息都在userInfo中
    // 你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    NSLog(@"AvoidCrash - %@",note.userInfo);
    NSArray *array = [kUserDefaults arrayForKey:kUserDefaultsKey_CrashMsgRecord];
    if (!array) {
        array = [NSArray new];
    }
    CRCrashRecord *record = [CRCrashRecord crashRecordByAvoidCrashInfoDict:note.userInfo];
    array = [array arrayByAddingObject:[record toData]];
    [kUserDefaults setObject:array forKey:kUserDefaultsKey_CrashMsgRecord];
    [kUserDefaults synchronize];
}

/** 上传崩溃日志 */
- (void)commitCrashRecordToSeverIfNeeded {
    NSArray *records = [kUserDefaults arrayForKey:kUserDefaultsKey_CrashMsgRecord];
    if (!records || [records isEqual:[NSNull null]] || records.count == 0) {
        return;
    }
    // 提交至服务器
//    [HHTDataEngine crashRecordCommit:records finished:^(BOOL success, NSString *msg) {
//        if (success) {
//            [kUserDefaults removeObjectForKey:kUserDefaultsKey_CrashMsgRecord];
//            [kUserDefaults synchronize];
//        }
//    }];
}

#pragma mark - 控制器配置
/** 获取当前根控制器 */
- (UIViewController *)rootViewController {
    return self.window.rootViewController;
}

/** 切换新的根控制器为TabBarVc */
- (void)showTabBarRootVcByCompletion:(void (^)(BOOL finished))completion {
    kApplication.statusBarStyle = UIStatusBarStyleLightContent;
    self.window.rootViewController = [self normalTabBarController];
    if (completion) completion(YES);
}

/** 获取并配置TabBar类型控制器 */
- (UITabBarController *)normalTabBarController {
    NSInteger tag = 0;
    CRNavigationController *classHubNav = [self navControllerWithRootVc:[CRPartOneViewController new]
                                                                   title:@"示例1"
                                                           normalImgName:@"tab_classHub_nor"
                                                         selectedImgName:@"tab_classHub_sel"
                                                                     tag:tag++];
    
    CRNavigationController *manageNav = [self navControllerWithRootVc:[CRPartTwoViewController new]
                                                                 title:@"示例2"
                                                         normalImgName:@"tab_manage_nor"
                                                       selectedImgName:@"tab_manage_sel"
                                                                   tag:tag++];
    
    CRNavigationController *momentNav = [self navControllerWithRootVc:[CRPartThreeViewController new]
                                                                 title:@"示例3"
                                                         normalImgName:@"tab_moment_nor"
                                                       selectedImgName:@"tab_moment_sel"
                                                                   tag:tag++];
    
    CRNavigationController *mineNav = [self navControllerWithRootVc:[CRPartFourViewController new]
                                                               title:@"示例4"
                                                       normalImgName:@"tab_mine_nor"
                                                     selectedImgName:@"tab_mine_sel"
                                                                 tag:tag++];
    
    CRTabBarController *tabBarVc = [CRTabBarController new];
    tabBarVc.viewControllers = @[classHubNav, manageNav, momentNav, mineNav];
    tabBarVc.tabBar.barTintColor = TM_Color_BarTint_Gray;
    return tabBarVc;
}

/** NavC构造方法 */
- (CRNavigationController *)navControllerWithRootVc:(CRBaseViewController *)rootVc title:(NSString *)title normalImgName:(NSString *)norImgName selectedImgName:(NSString *)selImgName tag:(NSInteger)tag {
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:nil tag:tag];
    UIImage *norImg = [Image_Name(norImgName) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBarItem setImage:norImg];
    UIImage *selImg = [Image_Name(selImgName) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBarItem setSelectedImage:selImg];
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:TM_BoldFont(10),
                                         NSForegroundColorAttributeName:Color_RGB(191, 191, 191)} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:TM_BoldFont(10),
                                         NSForegroundColorAttributeName:TM_Color_ThemeMain} forState:UIControlStateSelected];
    tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    rootVc.hideCustomBackBarButtonItem = YES;
    CRNavigationController *navController = [[CRNavigationController alloc] initWithRootViewController:rootVc];
    navController.tabBarItem = tabBarItem;
    return navController;
}

@end
