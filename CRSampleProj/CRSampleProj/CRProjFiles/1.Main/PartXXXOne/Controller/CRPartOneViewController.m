//
//  CRPartOneViewController.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRPartOneViewController.h"

@interface CRPartOneViewController ()

@end

@implementation CRPartOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"示例一";
    [self loadUI];
}

- (void)onClickedSampleBtn:(id)sender {
    Class sampleVcClass = NSClassFromString(@"CRSampleViewController");
    if (sampleVcClass == Nil) {
        NSLog(@"CRSampleViewController Class Not Found.");
        return;
    }
    UIViewController *sampleVc = [sampleVcClass new];
    [self.navigationController pushViewController:sampleVc animated:YES];
}
    
- (void)loadUI {
    CRPlainButton *btn = [CRPlainButton roundButtonDefaultWithPlainType:CRPlainButtonTypeBackground title:@"示例"];
    [btn addTarget:self action:@selector(onClickedSampleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    CGFloat btnHeight = 40.f;
    CGFloat btnWidth = 120.f;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.height.mas_equalTo(btnHeight);
        make.width.mas_equalTo(btnWidth);
    }];
}

@end
