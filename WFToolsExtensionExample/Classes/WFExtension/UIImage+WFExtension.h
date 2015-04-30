//
//  UIImage+WFExtension.h
//  UIImage
//
//  Created by 开发者 on 15/1/4.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WFExtension)

/**
 *  改变图片颜色
 *
 *  @param color 颜色
 *
 *  @return 更改过的图片
 */
- (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  高斯模糊图片
 *
 *  @param blur 模糊值
 *
 *  @return 模糊处理过的图片
 */
- (UIImage *)blurryImageWithRadius:(CGFloat)radius;

/**
 *  将图片放大/缩小到Size大小
 *
 *  @param size 缩放后的大小
 *
 *  @return 缩放后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size;
@end
