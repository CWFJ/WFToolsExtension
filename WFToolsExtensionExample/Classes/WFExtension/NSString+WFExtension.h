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

/**
 *  拼接路径到Document文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Document/test.m
 */
- (NSString *)appendDocumentDir;

/**
 *  拼接路径到Cache文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Cache/test.m
 */
- (NSString *)appendCacheDir;

/**
 *  拼接路径到Tmp文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Tmp/test.m
 */
- (NSString *)appendTmpDir;

/**
 *  字符串十六进制值
 *
 *  @return 数值
 *  @note   例：@"1F" = 31 @"AB" = 171 
 */
- (NSUInteger)hexValue;

/**
 *  获取NSString所占用的Size大小
 *
 *  @param fontSize 字体大小
 *  @param maxSize  最大Size
 *
 *  @return 占用的Size大小
 */
- (CGSize)labelAutoCalculateRectWithFontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;

@end
