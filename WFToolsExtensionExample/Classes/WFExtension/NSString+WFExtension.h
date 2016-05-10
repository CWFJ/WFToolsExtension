//
//  NSString+WFExtension
//  字符串扩展
//
//  Created by 开发者 on 14/12/21.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (WFExtension)

#pragma mark ------<拼接路径到Document文件夹>
/**
 *  拼接路径到Document文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Document/test.m
 */
- (NSString *)appendDocumentDir;

#pragma mark ------<拼接路径到Cache文件夹>
/**
 *  拼接路径到Cache文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Cache/test.m
 */
- (NSString *)appendCacheDir;

#pragma mark ------<拼接路径到Tmp文件夹>
/**
 *  拼接路径到Tmp文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Tmp/test.m
 */
- (NSString *)appendTmpDir;

#pragma mark ------<将绝对地址转化为相对地址>
/**
 *  将绝对地址转化为相对地址
 *
 *  @return 相对地址
 */
- (NSString *) absolutePath2RelativePath;

#pragma mark ------<将相对地址转化为绝对地址>
/**
 *  将相对地址转化为绝对地址
 *
 *  @return 相对地址
 */
- (NSString *) relativePath2AbsolutePath;

#pragma mark ------<获取字符串十六进制值>
/**
 *  字符串十六进制值
 *
 *  @return 数值
 *  @note   例：@"1F" = 31 @"AB" = 171 
 */
- (NSUInteger)hexValue;

#pragma mark ------<获取NSString所占用的Size大小>
/**
 *  获取NSString所占用的Size大小
 *
 *  @param fontSize 字体大小
 *  @param maxWidth 最大宽度
 *
 *  @return 占用的Size大小
 */
- (CGSize)labelAutoCalculateRectWithFontSize:(CGFloat)fontSize maxWidth:(CGFloat)maxWidth;

#pragma mark ------<判断字符串是否为空>
/**
 *  判断字符串是否为空
 *
 *  @return 结果
 */
+ (BOOL)isNil:(NSString *)str;

#pragma mark ------<判断是否为电话>
/**
 *  判断是否为电话
 *
 *  @return 是否为电话
 */
- (BOOL)isTelString;

#pragma mark ------<判断是否为邮箱>
/**
 *  判断是否为邮箱
 *
 *  @return 是否为邮箱
 */
-(BOOL)isValidateEmail;


#define kDataFormat_Tue_Mar_29_00_00_00_CST_2016 @"E MMM dd HH:mm:ss z yyyy"

#pragma mark ------<将时间字符串转化为日期>
/**
 *  将时间字符串转化为日期
 *
 *  @param format 字符串格式
 *
 *  @return 日期
 *  @note   默认时区为en_US
 */
- (NSDate *)dateWithFormat:(NSString *)format;

#pragma mark ------<将一定时区的日期字符串转化为日期>
/**
 *  将一定时区的日期字符串转化为日期
 *
 *  @param format           字符串格式
 *  @param localeIdentifier 时区标识
 *
 *  @return 日期
 */
- (NSDate *)dateWithFormat:(NSString *)format local:(NSString *)localeIdentifier;

#pragma mark ------<将日期字符串转化为易阅读的字符串>
/**
 *  将日期字符串转化为易阅读的字符串
 *
 *  @param format           字符串格式
 *  @param type             转换类型
 *
 *  @return 转换后的字符串
 *  @note   Type:
 *          0:<xxxx年xx月xx日 xx:xx> <xx月xx日 xx:xx> <昨天 xx:xx> <xx:xx> <xx分钟前> <刚刚>
 *          1:<xxxx年xx月xx日> <xx月xx日> <xx天前> <xx小时前> <xx分钟前> <刚刚>
 *          2:<xxxx年xx月xx日> <xx月xx日> <昨天> <xx:xx> <xx分钟前> <刚刚>
 *          默认时区为en_US
 */
- (NSString *)readabilityDateStringWithFormate:(NSString *)format type:(NSInteger)type;

#pragma mark ------<将一定时区的日期字符串转化为易阅读的字符串>
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
- (NSString *)readabilityDateStringWithFormate:(NSString *)format local:(NSString *)localeIdentifier type:(NSInteger)type;

#pragma mark ------<转化日期字符串格式>
/**
 *  转化日期字符串格式
 *
 *  @param srcFormat        源格式
 *  @param dstFormat        目标格式
 *
 *  @return 转化后的字符串
 */
- dateStringChangeFormatFrom:(NSString *)srcFormat to:(NSString *)dstFormat;

#pragma mark ------<转化日期字符串格式>
/**
 *  转化日期字符串格式
 *
 *  @param srcFormat        源格式
 *  @param dstFormat        目标格式
 *  @param localeIdentifier 时区标识
 *
 *  @return 转化后的字符串
 */
- (NSString *)dateStringChangeFormatFrom:(NSString *)srcFormat to:(NSString *)dstFormat local:(NSString *)localeIdentifier;
@end
