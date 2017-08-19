//
//  UIView+RTL.h
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/View+MASAdditions.h>
@interface UIView (RTL)
/**
 支持RTL的left
 */
- (MASViewAttribute *)mas_leftRTL;
/**
 支持RTL的right
 */
- (MASViewAttribute *)mas_rightRTL;
@end
