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
CGSize CGScaleSizetoFit(CGSize srcSize, CGSize dstSize) {
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