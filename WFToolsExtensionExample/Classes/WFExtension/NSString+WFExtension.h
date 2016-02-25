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
@end
