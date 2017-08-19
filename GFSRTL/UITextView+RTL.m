//
//  UITextView+RTL.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "UITextView+RTL.h"
#import <objc/runtime.h>
#import "RTLManager.h"
@implementation UITextView (RTL)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL old = @selector(setTextAlignment:);
        SEL new = @selector(RTL_setAlignment:);
        
        Method oldP = class_getInstanceMethod(self, old);
        Method newP = class_getInstanceMethod(self, new);
        
        method_exchangeImplementations(oldP, newP);
    });
}
- (void)RTL_setAlignment:(NSTextAlignment)align
{
    if ([[RTLManager appearance]RTL]) {
        if (align == NSTextAlignmentLeft) {
            align = NSTextAlignmentRight;
        }else if (align == NSTextAlignmentRight) {
            align = NSTextAlignmentLeft;
        }
    }
    [self RTL_setAlignment:align];
}
@end
