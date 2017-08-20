//
//  CRBaseViewController.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRPlainButton;

@interface CRBaseViewController : UIViewController

@property (nonatomic, assign) BOOL hideCustomBackBarButtonItem;
@property (nonatomic, copy) void(^operatedCompletionHandler)(id obj);

- (void)loadUI;
- (void)setupUI;

#pragma mark - BarButtonItems (PlainText)
- (void)loadDefaultPlainTextLeftBarButtonItemsWithtTitle:(NSString *)title;

- (void)onClickedDefaultPlainTextLeftBarBtn:(id)sender;

- (CRPlainButton *)leftDefaultPlainTextBarBtn;

- (void)loadDefaultPlainTextRightBarButtonItemsWithtTitle:(NSString *)title;

- (void)onClickedDefaultPlainTextRightBarBtn:(id)sender;

- (CRPlainButton *)rightDefaultPlainTextBarBtn;

#pragma mark - GoBack
- (UIButton *)customBackButton;

- (void)onClickedBack:(id)sender;

- (void)goBackPrevViewController;

@end
