//
//  MASConstraint+RTL.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "MASConstraint+RTL.h"
#import "RTLManager.h"
@implementation MASConstraint (RTL)

- (MASConstraint * (^)(CGFloat))offset_RTL {
    
    return ^id(CGFloat offset){
        BOOL RTL = [[RTLManager appearance]RTL];
        if (RTL) {
            self.offset = -offset;
        }else{
            self.offset = offset;
        }
        return self;
    };
}
@end
