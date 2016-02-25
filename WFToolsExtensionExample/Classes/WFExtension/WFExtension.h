//
//  WFExtension.h
//  WFExtension
//
//  Created by 开发者 on 15/3/21.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#ifndef WFExtension_WFExtension_h
#define WFExtension_WFExtension_h

#import "UIView+WFExtension.h"
#import "NSString+WFExtension.h"
#import "CGSize+WFExtension.h"
#import "UIImage+WFExtension.h"
#import "NSDate+WFExtension.h"
#import "UIColor+WFExtension.h"

/** 屏幕宽 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/** 屏幕高 */
#define SCREEN_HIGHT [UIScreen mainScreen].bounds.size.height

/** iPhone 4 */

#define IPHONE_4 [UIScreen mainScreen].bounds.size.height == 480

//横向比例
#define WidthScale(number) ([UIScreen mainScreen].bounds.size.width/320*(number))
//纵向比例
#define HeightScale(number) ([UIScreen mainScreen].bounds.size.height/480*(number))

#define SYSTEM_VERSION [UIDevice currentDevice].systemVersion.doubleValue

#define BUNDLE_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define BUILD_VERSION  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

#endif
