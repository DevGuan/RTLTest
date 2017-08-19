//
//  MASConstraint+RTL.h
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import <Masonry/Masonry.h>

@interface MASConstraint (RTL)
/**
 支持RTL的offset  请按照正常值填写
 */
- (MASConstraint * (^)(CGFloat offset))offset_RTL;

@end
