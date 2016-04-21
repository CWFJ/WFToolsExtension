//
//  CGSize+WFExtension.m
//  CGSize
//
//  Created by 开发者 on 13/2/15.
//  Copyright (c) 2013年 Jason. All rights reserved.
//

#import "CGSize+WFExtension.h"

/**
 *  将原始的CGSize等比例放大到 与目标CGSize 最合适的大小
 *
 *  @param srcSize 源Size
 *  @param dstSize 目标Size
 *
 *  @return 最合适的大小
 *  @note   类似与image填充的Aspect Fill类型
 */
CGSize CGZoomSizetoFit(CGSize srcSize, CGSize dstSize) {
    if(srcSize.width == 0 || srcSize.height == 0) return srcSize;
    if(srcSize.width < dstSize.width) {
        srcSize.height *= dstSize.width/srcSize.width;
        srcSize.width = dstSize.width;
    }
    if(srcSize.height < dstSize.height) {
        srcSize.width *= dstSize.height/srcSize.height;
        srcSize.height = dstSize.height;
    }
    
    return srcSize;
}

#pragma mark ------<将原始的CGSize等比例缩放到 与目标CGSize 最合适的大小>
/**
 *  将原始的CGSize等比例缩放到 与目标CGSize 最合适的大小
 *
 *  @param srcSize 原始尺寸
 *  @param minSize 最小尺寸
 *  @param maxSize 最大尺寸
 *
 *  @return 最合适的大小
 */
CGSize CGScaleSizetoFit(CGSize srcSize, CGSize minSize, CGSize maxSize) {
    if(srcSize.width == 0 || srcSize.height == 0) return srcSize;
    if(srcSize.width < minSize.width) {
        srcSize.height *= minSize.width/srcSize.width;
        srcSize.width = minSize.width;
    }
    if(srcSize.height < minSize.height) {
        srcSize.width *= minSize.height/srcSize.height;
        srcSize.height = minSize.height;
    }
    if(srcSize.width > maxSize.width) {
        srcSize.height *= maxSize.width/srcSize.width;
        srcSize.width = maxSize.width;
    }
    if(srcSize.height > maxSize.height) {
        srcSize.width *= maxSize.height/srcSize.height;
        srcSize.height = maxSize.height;
    }
    return srcSize;
}