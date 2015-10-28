//
//  NSDate+WFExtension.h
//  Speak+
//
//  Created by 开发者 on 15/7/18.
//  Copyright (c) 2015年 RuiDun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WFExtension)

/**
 *  将时间转化为本地时间
 *
 *  @return 本地时间
 */
- (NSDate *)localizationDate;

/**
 *  任意时区转换为本地时间
 *
 *  @param abbreviation 时区名称
 *
 *  @return 本地时间
 */
- (NSDate *)localizationDateTimeZone:(NSString *)abbreviation;
@end
