//
//  MASConstraintMaker+RTL.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "MASConstraintMaker+RTL.h"
#import <objc/runtime.h>
#import "RTLManager.h"
@implementation MASConstraintMaker (RTL)

+ (void)load
{
    /*
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 交换方法  取出masonry的一个私有方法
        
        unsigned int count = 0;
        Method *allFuncs = class_copyMethodList(self, &count);
        SEL private = NULL;
        for (int i = 0; i < count; i++) {
            SEL method = method_getName(allFuncs[i]);
    
            NSString *methodName = [NSString stringWithCString:sel_getName(method) encoding:NSUTF8StringEncoding];
//            NSLog(@"member method:%@", methodName);
            
            if ([methodName isEqualToString:@"addConstraintWithLayoutAttribute:"]) {
                private = method;
            }
        }
        Method oldP = class_getInstanceMethod(self, private);
        Method newP = class_getInstanceMethod(self, @selector(YS_addConstraintWithLayoutAttribute:));
        
        method_exchangeImplementations(oldP, newP);
    });
     */
}
- (void)setLeft_RTL:(MASConstraint *)left_RTL
{
    // 不需要
}
- (void)setRight_RTL:(MASConstraint *)right_RTL
{
    // 不需要
}

- (MASConstraint *)left_RTL
{
    BOOL RTL = [[RTLManager appearance]RTL];
    return RTL ? self.right : self.left;
//    return [self YS_addConstraintWithLayoutAttribute:RTL ? NSLayoutAttributeRight :NSLayoutAttributeLeft];
}
- (MASConstraint *)right_RTL
{
    BOOL RTL = [[RTLManager appearance]RTL];
    return RTL ? self.left : self.right;
//    return [self YS_addConstraintWithLayoutAttribute:RTL ? NSLayoutAttributeLeft : NSLayoutAttributeRight];
}

//- (MASConstraint *)left
//{
//    BOOL RTL = [[RTLManager appearance]RTL];
//    return [self YS_addConstraintWithLayoutAttribute:RTL ? NSLayoutAttributeRight :NSLayoutAttributeLeft];
//}
//- (MASConstraint *)right
//{
//    BOOL RTL = [[RTLManager appearance]RTL];
//    return [self YS_addConstraintWithLayoutAttribute:RTL ? NSLayoutAttributeLeft : NSLayoutAttributeRight];
//}


//- (MASConstraint*)YS_addConstraintWithLayoutAttribute:(NSLayoutAttribute) layoutAttribute{
//
//    return [self YS_addConstraintWithLayoutAttribute:layoutAttribute];
//}
@end
