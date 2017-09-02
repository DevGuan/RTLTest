//
//  UITextField+RTL.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "UITextField+RTL.h"
#import <objc/runtime.h>
#import "RTLManager.h"
@implementation UITextField (RTL)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL old = @selector(setTextAlignment:);
        SEL new = @selector(RTL_setAlignment:);
        
        Method oldP = class_getInstanceMethod(self, old);
        Method newP = class_getInstanceMethod(self, new);
        
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(setPlaceholder:)), class_getInstanceMethod(self, @selector(RTL_setPlaceholder:)));
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

- (void)RTL_setPlaceholder:(NSString *)placeHolder
{
    NSMutableParagraphStyle *style = [self.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.alignment = [[RTLManager appearance]RTL] ? NSTextAlignmentRight : NSTextAlignmentLeft;
    
    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeHolder attributes:@{NSParagraphStyleAttributeName : style}];
    [self RTL_setPlaceholder:placeHolder];
}
@end
