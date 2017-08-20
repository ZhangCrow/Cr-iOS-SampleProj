//
//  UIBarButtonItem+CRAdd.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "UIBarButtonItem+CRAdd.h"

@implementation UIBarButtonItem (CRAdd)

+ (instancetype)barButtonSystemItemFixedSpace {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];;
}

@end
