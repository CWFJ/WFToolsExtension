//
//  UIColor+WF.h
//  ZAKER
//
//  Created by 开发者 on 15/4/4.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WFExtension)

/**
 *  通过字符串获取颜色值
 *
 *  @param rgb rgb字符串
 *
 *  @return 颜色值
 *
 *  @note  例：#FFFFFF / ffffff样式
 */
+ (instancetype)colorWithRGBString:(NSString *)rgb;

#pragma mark ------<获取颜色的RGB数值>
/**
 *  获取颜色的RGB数值
 *
 *  @param complete 完成后的回调
 */
- (void)getRGBComponents:(void(^)(CGFloat red, CGFloat green, CGFloat blue))complete;


@end
