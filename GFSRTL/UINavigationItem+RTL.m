//
//  UINavigationItem+RTL.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/19.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "UINavigationItem+RTL.h"
#import <objc/runtime.h>
#import "RTLManager.h"
@implementation UINavigationItem (RTL)
+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setLeftBarButtonItem:)), class_getInstanceMethod(self, @selector(RTL_setLeftBarButtonItem:)));
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setRightBarButtonItem:)), class_getInstanceMethod(self, @selector(RTL_setRightBarButtonItem:)));
}
- (void)RTL_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    if ([[RTLManager appearance]RTL]) {
        [self RTL_setRightBarButtonItem:leftBarButtonItem];
    }else{
        [self RTL_setLeftBarButtonItem:leftBarButtonItem];
    }
    
}
- (void)RTL_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    if (![[RTLManager appearance]RTL]) {
        [self RTL_setRightBarButtonItem:rightBarButtonItem];
    }else{
        [self RTL_setLeftBarButtonItem:rightBarButtonItem];
    }
}
@end
