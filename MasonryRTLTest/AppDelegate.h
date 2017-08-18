//
//  AppDelegate.h
//  MasonryRTLTest
//
//  Created by 管复生 on 2017/8/18.
//  Copyright © 2017年 DevGuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign ,getter=isRTL)BOOL RTL;

@end

