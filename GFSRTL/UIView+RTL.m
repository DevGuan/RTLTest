//
//  UIView+RTL.m
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import "UIView+RTL.h"
#import "RTLManager.h"
@implementation UIView (RTL)


- (MASViewAttribute *)mas_leftRTL
{
    BOOL RTL = [[RTLManager appearance]RTL];
    
    return RTL ? self.mas_right : self.mas_left;
//    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:RTL ? NSLayoutAttributeRight : NSLayoutAttributeLeft];
}
- (MASViewAttribute *)mas_rightRTL
{
    BOOL RTL = [[RTLManager appearance]RTL];
    
    return RTL ? self.mas_left : self.mas_right;
//    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:RTL ? NSLayoutAttributeLeft : NSLayoutAttributeRight];
}
@end
