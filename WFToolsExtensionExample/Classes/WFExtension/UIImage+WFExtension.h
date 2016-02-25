//
//  UIImage+WFExtension.h
//  UIImage
//
//  Created by 开发者 on 15/1/4.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WFExtension)

#pragma mark ------<改变图片颜色>
/**
 *  改变图片颜色
 *
 *  @param color 颜色
 *
 *  @return 更改过的图片
 */
- (UIImage *)imageWithColor:(UIColor *)color;

#pragma mark ------<高斯模糊图片>
/**
 *  高斯模糊图片
 *
 *  @param blur 模糊值
 *
 *  @return 模糊处理过的图片
 */
- (UIImage *)blurryImageWithRadius:(CGFloat)radius;

#pragma mark ------<将图片放大/缩小到Size大小>
/**
 *  将图片放大/缩小到Size大小
 *
 *  @param size 缩放后的大小
 *
 *  @return 缩放后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size;

/**
 *  修正图片信息
 *
 *  @param aImage 待修正的图片
 *
 *  @return 已修正的图片
 *
 *  @note 用相机拍摄出来的照片含有EXIF信息，UIImage的imageOrientation属性指的就是EXIF中的orientation信息。
 *  如果我们忽略orientation信息，而直接对照片进行像素处理或者drawInRect等操作，得到的结果是翻转或者旋转90之后
 *  的样子。这是因为我们执行像素处理或者drawInRect等操作之后，imageOrientaion信息被删除了，imageOrientaion
 *  被重设为0，造成照片内容和imageOrientaion不匹配。所以，在对照片进行处理之前，先将照片旋转到正确的方向，并且
 *  返回的imageOrientaion为0。
 */
- (UIImage *)fixOrientationImage;
@end
