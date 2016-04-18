//
//  NSObject+WFExtension.h
//  WFToolsExtensionExample
//
//  Created by Jason on 16/4/18.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (WFExtension)

- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
