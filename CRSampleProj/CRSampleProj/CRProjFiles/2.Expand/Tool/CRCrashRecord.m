//
//  CRCrashRecord.m
//  CRSampleProj
//
//  Created by 乌鸦君 on 17/08/20.
//  Copyright © 2017年 doubleC. All rights reserved.
//

#import "CRCrashRecord.h"
#import "NSDictionary+SafeAccess.h"

@implementation CRCrashRecord

+ (instancetype)crashRecordByAvoidCrashInfoDict:(NSDictionary *)dict {
    CRCrashRecord *item = [self new];
    item.name = [dict stringForKey:@"errorName"];
    item.position = [dict stringForKey:@"errorReason"];
    item.detail = [dict stringForKey:@"errorPlace"];
    item.remark = [dict stringForKey:@"defaultToDo"];
    item.callStackSymbols = [dict arrayForKey:@"callStackSymbols"];
    item.timestamp = [NSNumber numberWithLongLong:(long long)[[NSDate date] timeIntervalSince1970]];
    return item;
}

+ (instancetype)crashRecordByData:(NSData *)data {
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

- (NSData *)toData {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    return data;
}

@end
