//
//  CRCrashRecord.h
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRBaseModel.h"

@interface CRCrashRecord : CRBaseModel

// 来自AvoidCrashUserInfoDict
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *remark;
@property (nonatomic, copy) NSArray *callStackSymbols;

// 自定义属性
@property (nonatomic, strong) NSNumber *timestamp;

+ (instancetype)crashRecordByAvoidCrashInfoDict:(NSDictionary *)dict;

+ (instancetype)crashRecordByData:(NSData *)data;

- (NSData *)toData;

@end
