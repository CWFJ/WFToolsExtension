//
//  WFExtension(Log).m
//  WFExtension
//
//  Created by 开发者 on 15/2/1.
//  Copyright (c) 2015年 Jason. All rights reserved.
//  自定义Log输出

#import "WFExtension(Log).h"

#pragma mark ------<NSArray>
@implementation NSArray (Log)

/**
 *  重写descriptionWithLocale方法，自定义打印数组
 */
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *mStr = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mStr appendFormat:@"\t%@,\n", obj];
    }];
    
    [mStr appendString:@")"];
    
    return mStr;
}

@end

#pragma mark ------<NSDictionary>
@implementation NSDictionary (Log)

/**
 *  重写descriptionWithLocale方法，自定义打印字典
 */
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *mStr = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mStr appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [mStr appendString:@"}\n"];
    return mStr;
}

@end