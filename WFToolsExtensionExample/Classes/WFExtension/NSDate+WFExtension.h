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

#pragma mark ------<将日期字符串转化为易阅读的字符串>
/**
 *  将一定时区的日期字符串转化为易阅读的字符串
 *
 *  @param format           字符串格式
 *  @param localeIdentifier 时区标识
 *  @param type             转换类型
 *
 *  @return 转换后的字符串
 *  @note   Type:
 *          0:<xxxx年xx月xx日 xx:xx> <xx月xx日 xx:xx> <昨天 xx:xx> <xx:xx> <xx分钟前> <刚刚>
 *          1:<xxxx年xx月xx日> <xx月xx日> <xx天前> <xx小时前> <xx分钟前> <刚刚>
 *          2:<xxxx年xx月xx日> <xx月xx日> <昨天> <xx:xx> <xx分钟前> <刚刚>
 */
- (NSString *)readabilityDateStringWithType:(NSInteger)type;

#pragma mark ------<获取日期字符串>
/**
 *  获取日期字符串
 *
 *  @param format 字符串格式
 *
 *  @return 日期字符串
 */
- (NSString *)dateStringWithFormat:(NSString *)format;
@end
