//
//  MASConstraintMaker+RTL.h
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import <Masonry/Masonry.h>

@interface MASConstraintMaker (RTL)
@property (nonatomic, strong, readonly) MASConstraint *left_RTL;
@property (nonatomic, strong, readonly) MASConstraint *right_RTL;
@end
