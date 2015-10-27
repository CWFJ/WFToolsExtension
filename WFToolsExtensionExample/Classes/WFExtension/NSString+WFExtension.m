//
//  NSString+WFExtension
//  字符串扩展
//
//  Created by 开发者 on 14/12/21.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import "NSString+WFExtension.h"

@implementation NSString (WFExtension)

#pragma mark ------<拼接Tmp文件夹路径>
/**
 *  拼接路径到Tmp文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Tmp/test.m
 */
- (NSString *)appendTmpDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

#pragma mark ------<拼接Cache文件夹路径>
/**
 *  拼接路径到Cache文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Cache/test.m
 */
- (NSString *)appendCacheDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

#pragma mark ------<拼接Document文件夹路径>
/**
 *  拼接路径到Document文件夹
 *
 *  @return 拼接好的路径信息
 *  @note   例：test.m ----> ...Document/test.m
 */
- (NSString *)appendDocumentDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

#pragma mark ------<十六进制字符串>
/**
 *  字符串十六进制值
 *
 *  @return 数值
 *  @note   例：@"1F" = 31 @"AB" = 171
 */
- (NSUInteger)hexValue {
    NSUInteger i = 0;
    const char *str = [self UTF8String];
    
    NSUInteger returnValue = 0;
    while (i++ < self.length) {
        char currChar = str[i - 1];
        char type = '0';
        if((currChar >= '0' && currChar <= '9' && (type = '0')) || \
           (currChar >= 'A' && currChar <= 'Z' && (type = ('A' - 10))) || \
           (currChar >= 'a' && currChar <= 'z' && (type = ('a' - 10))))
        {
            returnValue *= 16;
            returnValue += currChar - type;
        }
        else
        {
            returnValue = -1;
            break;
        }
    }
    
    return returnValue;
}

#pragma mark ------<获取NSString所占用的Size大小>
/**
 *  获取NSString所占用的Size大小
 *
 *  @param fontSize 字体大小
 *  @param maxWidth 最大宽度
 *
 *  @return 占用的Size大小
 */
- (CGSize)labelAutoCalculateRectWithFontSize:(CGFloat)fontSize maxWidth:(CGFloat)maxWidth {
    NSMutableParagraphStyle *paragraghStyle = [[NSMutableParagraphStyle alloc] init];
    /** 设置行间距 */
    [paragraghStyle setLineSpacing:2];
    paragraghStyle.lineBreakMode = NSLineBreakByWordWrapping;
    /** 设置字体 */
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraghStyle.copy};
    /** 最大大小 */
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    /** 计算占用大小 */
    CGSize labelSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:attr context:nil].size;
    /** 向上取整 */
    labelSize.height = ceil(labelSize.height);
    labelSize.width = ceil(labelSize.width);
    
    return labelSize;
}

#pragma mark ------<判断字符串是否为空>
/**
 *  判断字符串是否为空
 *
 *  @return 结果
 */
+ (BOOL)isNil:(NSString *)str {
    return (str.length == 0);
}

#pragma mark ------<判断是否为电话>
/**
 *  判断是否为电话
 *
 *  @return 是否为电话
 */
- (BOOL)isTelString {
    if (self.length == 0) {
        return NO;
    }
    NSString *regex = @"^[1][3,4,5,7,8][0-9]{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
@end
