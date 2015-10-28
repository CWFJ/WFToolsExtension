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
@end
