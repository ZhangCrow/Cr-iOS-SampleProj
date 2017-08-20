//
//  CRBaseViewController.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRBaseViewController.h"

@interface CRBaseViewController ()

@property (nonatomic, strong) CRPlainButton *rightDefaultPlainTextBarBtn;
@property (nonatomic, strong) CRPlainButton *leftDefaultPlainTextBarBtn;

@end

@implementation CRBaseViewController

- (instancetype)init {
    if (self = [super init]) {
        self.hideCustomBackBarButtonItem = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TM_Color_Backgound_Gray;
}

- (void)loadUI {
    return;
}

- (void)setupUI {
    return;
}

#pragma mark - BarButtonItems (PlainText)
- (void)loadDefaultPlainTextRightBarButtonItemsWithtTitle:(NSString *)title {
    CRPlainButton *button = [CRPlainButton roundButtonWithPlainType:CRPlainButtonTypeTitle
                                                                title:title
                                                                 font:TM_Font_NavText
                                                          colorNormal:TM_Color_White
                                                     colorHighlighted:Color_RGBA(255, 255, 255, 0.5)
                                                        colorDisabled:Color_RGBA(255, 255, 255, 0.5)];
    button.frame = CGRectMake(0, 0, 35, 40);
    [button addTarget:self action:@selector(onClickedDefaultPlainTextRightBarBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *spacer = [UIBarButtonItem barButtonSystemItemFixedSpace];
    spacer.width = -10;
    self.navigationItem.rightBarButtonItems = @[spacer, barBtnItem];
    self.rightDefaultPlainTextBarBtn = button;
}

- (void)loadDefaultPlainTextLeftBarButtonItemsWithtTitle:(NSString *)title {
    CRPlainButton *button = [CRPlainButton roundButtonWithPlainType:CRPlainButtonTypeTitle
                                                                title:title
                                                                 font:TM_Font_NavText
                                                          colorNormal:TM_Color_White
                                                     colorHighlighted:Color_RGBA(255, 255, 255, 0.5)
                                                        colorDisabled:Color_RGBA(255, 255, 255, 0.5)];
    button.frame = CGRectMake(0, 0, 35, 40);
    [button addTarget:self action:@selector(onClickedDefaultPlainTextLeftBarBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *spacer = [UIBarButtonItem barButtonSystemItemFixedSpace];
    spacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[spacer, barBtnItem];
    self.leftDefaultPlainTextBarBtn = button;
}

- (void)onClickedDefaultPlainTextLeftBarBtn:(id)sender {
    return;
}

- (void)onClickedDefaultPlainTextRightBarBtn:(id)sender {
    return;
}

#pragma mark - About GoBack
- (void)setHideCustomBackBarButtonItem:(BOOL)hideCustomBackBarButtonItem
{
    _hideCustomBackBarButtonItem = hideCustomBackBarButtonItem;
    if (hideCustomBackBarButtonItem) {
        self.navigationItem.leftBarButtonItems = nil;
    }else{
        [self loadCustomBackBarButtonItem];
    }
}

- (void)loadCustomBackBarButtonItem {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:[self customBackButton]];
    UIBarButtonItem *spacer = [UIBarButtonItem barButtonSystemItemFixedSpace];
    spacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[spacer,backItem];
}

- (UIButton *)customBackButton {
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    backButton.titleLabel.font = TM_Font_NavText;
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    NSString *title = @"返回";
    UIFont *font = TM_Font_NavText;
    NSDictionary *attributesNor = @{
                                    NSFontAttributeName : font,
                                    NSForegroundColorAttributeName : TM_Color_White
                                    };
    NSAttributedString *attributedTitleNor = [[NSAttributedString alloc] initWithString:title
                                                                             attributes:attributesNor];
    NSDictionary *attributesHig = @{
                                    NSFontAttributeName : font,
                                    NSForegroundColorAttributeName : TM_Color_ControlStateSel_Gray
                                    };
    NSAttributedString *attributedTitleHig = [[NSAttributedString alloc] initWithString:title
                                                                             attributes:attributesHig];
    [backButton setAttributedTitle:attributedTitleNor forState:UIControlStateNormal];
    [backButton setAttributedTitle:attributedTitleHig forState:UIControlStateHighlighted];
    [backButton setImage:Image_Name(@"nav_goBack_light_nor") forState:UIControlStateNormal];
    [backButton setImage:Image_Name(@"nav_goBack_light_lig") forState:UIControlStateHighlighted];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -7, 0, -7)];
    [backButton addTarget:self action:@selector(onClickedBack:) forControlEvents:UIControlEventTouchUpInside];
    return backButton;
}

- (void)onClickedBack:(id)sender {
    [self goBackPrevViewController];
}

- (void)goBackPrevViewController {
    [self.view endEditing:YES];
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Other

@end
