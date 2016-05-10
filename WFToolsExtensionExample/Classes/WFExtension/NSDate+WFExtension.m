//
//  NSDate+WFExtension.m
//  Speak+
//
//  Created by 开发者 on 15/7/18.
//  Copyright (c) 2015年 RuiDun. All rights reserved.
//

#import "NSDate+WFExtension.h"

@implementation NSDate (WFExtension)
/**
 *  将时间转化为本地时间
 *
 *  @return 本地时间
 */
- (NSDate *)localizationDate {
    NSTimeInterval  timeZoneOffset=[[NSTimeZone systemTimeZone] secondsFromGMT];
    NSDate *date = [self dateByAddingTimeInterval:timeZoneOffset];
    
    return date;
}

/**
 *  任意时区转换为本地时间
 *
 *  @param abbreviation 时区名称
 *
 *  @return 本地时间
 */
- (NSDate *)localizationDateTimeZone:(NSString *)abbreviation
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:abbreviation];//UTC或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:self];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:self];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:self];
    
    return destinationDateNow;
}

#pragma mark ------<获取日期字符串>
/**
 *  获取日期字符串
 *
 *  @param format 字符串格式
 *
 *  @return 日期字符串
 */
- (NSString *)dateStringWithFormat:(NSString *)format {
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    [formate setDateFormat:format];
    return [formate stringFromDate:self];
}

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
- (NSString *)readabilityDateStringWithType:(NSInteger)type {
    NSCalendar *cal = [NSCalendar currentCalendar];
    /** 从指定的时间中获取时间的组成成分 */
    
    NSDateComponents *cmps = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond  fromDate:self];
    
    NSDateComponents *cmpsNow = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    
    NSString *dateStr = nil;
    switch (type) {
        case 0:
        {
            if(((cmpsNow.year != cmps.year) && (dateStr = [NSString stringWithFormat:@"%ld%@%ld%@%ld%@ %02ld:%02ld", (long)cmps.year, @"年", (long)cmps.month, @"月", (long)cmps.day, @"日", (long)cmps.hour, (long)cmps.minute])) || \
               (((cmpsNow.month != cmps.month) || (cmpsNow.day - cmps.day > 1)) && (dateStr = [NSString stringWithFormat:@"%ld%@%ld%@ %02ld:%02ld", (long)cmps.month, @"月", (long)cmps.day, @"日", (long)cmps.hour, (long)cmps.minute])) || \
               ((cmpsNow.day != cmps.day) && (dateStr = [NSString stringWithFormat:@"%@ %02ld:%02ld", @"昨天", (long)cmps.hour, (long)cmps.minute])) || \
               ((cmpsNow.hour != cmps.hour) && (dateStr = [NSString stringWithFormat:@"%02ld:%02ld", (long)cmps.hour, (long)cmps.minute])) || \
               ((cmpsNow.minute != cmps.minute) && (dateStr = [NSString stringWithFormat:@"%ld%@", (long)cmpsNow.minute - (long)cmps.minute, @"分钟前"])) || \
               (dateStr = @"刚刚")) {
                return dateStr;
            }
        }
            break;
        case 1:
        {
            if(((cmpsNow.year != cmps.year) && (dateStr = [NSString stringWithFormat:@"%ld%@%ld%@%ld%@", (long)cmps.year, @"年", (long)cmps.month, @"月", (long)cmps.day, @"日"])) || \
               ((cmpsNow.month != cmps.month) && (dateStr = [NSString stringWithFormat:@"%ld%@%ld%@", (long)cmps.month, @"月", (long)cmps.day, @"日"])) || \
               ((cmpsNow.day != cmps.day) && (dateStr = [NSString stringWithFormat:@"%ld%@", (long)cmpsNow.day - (long)cmps.day, @"天前"])) || \
               ((cmpsNow.hour != cmps.hour) && (dateStr = [NSString stringWithFormat:@"%ld%@", (long)cmpsNow.hour - (long)cmps.hour, @"小时前"])) || \
               ((cmpsNow.minute != cmps.minute) && (dateStr = [NSString stringWithFormat:@"%ld%@", (long)cmpsNow.minute - (long)cmps.minute, @"分钟前"])) || \
               (dateStr = @"刚刚")) {
                return dateStr;
            }
        }
            break;
        case 2:
        {
            if(((cmpsNow.year != cmps.year) && (dateStr = [NSString stringWithFormat:@"%ld%@%ld%@%ld%@", (long)cmps.year, @"年", (long)cmps.month, @"月", (long)cmps.day, @"日"])) || \
               (((cmpsNow.month != cmps.month) || (cmpsNow.day - cmps.day > 1)) && (dateStr = [NSString stringWithFormat:@"%ld%@%ld%@", (long)cmps.month, @"月", (long)cmps.day, @"日"])) || \
               ((cmpsNow.day != cmps.day) && (dateStr = [NSString stringWithFormat:@"%@", @"昨天"])) || \
               ((cmpsNow.hour != cmps.hour) && (dateStr = [NSString stringWithFormat:@"%02ld:%02ld", (long)cmps.hour, (long)cmps.minute])) || \
               ((cmpsNow.minute != cmps.minute) && (dateStr = [NSString stringWithFormat:@"%ld%@", (long)cmpsNow.minute - (long)cmps.minute, @"分钟前"])) || \
               (dateStr = @"刚刚")) {
                return dateStr;
            }
        }
            break;
        default:
            break;
    }
    
    return dateStr;
}
@end
