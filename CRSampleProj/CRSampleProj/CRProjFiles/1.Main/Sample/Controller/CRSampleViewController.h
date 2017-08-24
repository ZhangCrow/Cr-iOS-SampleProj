//
//  CRSampleViewController.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/22.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRBaseViewController.h"

//  所有的 interfaces、categories 和 protocols 都应该有注释.
//  注释应该紧挨着被解释内容，它们之间应该 no blank line
#pragma mark - macro definition
// 宏定义
#pragma mark -  enum and callback block
// typedef枚举和回调block
#pragma mark - protocol
// 协议定义

@interface CRSampleViewController : CRBaseViewController

// 1.property
// 2.selector
// ［注］
//      <1> 遵循apple代码原则，最重要的property 和 selector，放到最靠前的位置
//      <2> 注意代码的封装性，减少不必要或过多的暴露property、selector
//      <3> .h的property和selector一定要加注释，这是给使用者看的，.m可只在需要的地方增加注释，提高代码的易读性
    
@end
