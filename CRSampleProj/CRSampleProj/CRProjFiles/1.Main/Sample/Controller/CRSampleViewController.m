//
//  CRSampleViewController.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/22.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRSampleViewController.h"

#pragma mark - macro definition
// 宏定义
#pragma mark -  enum and callback block
// typedef枚举和回调block
#pragma mark - protocol
// 协议定义

@interface CRSampleViewController ()

@end

@implementation CRSampleViewController

#pragma mark - initialization and layout
// 初始化和界面搭建，最重要
- (instancetype)init {
    if (self = [super init]) {
        // 数据的初始化
    }
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"示例控制器";
    // 控件加载代码 (建议：加载与布局隔离)
    [self loadUI];
    // 界面布局代码
    [self setupUI];
}
    
- (void)loadUI {
    // 控件加载代码
}
    
- (void)setupUI {
    // 界面布局代码
}
    
#pragma mark - updater
// 1、数据更新用，使用频率高
- (void)updateUI {
    // 2、更新UI显示
}
    
#pragma mark - onClick Action
// 点击事件
#pragma mark - delegate
// 代理方法
#pragma mark - public custom method
// 暴露出去的公有自定义方法
#pragma mark - private custom method
// 自己内部的私有自定义方法
#pragma mark - overrider super method
// 重写父类方法
#pragma mark - lazy load
// 一次性加载，使用频率低。

@end
