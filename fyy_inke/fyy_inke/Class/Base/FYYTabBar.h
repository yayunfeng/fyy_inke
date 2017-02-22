//
//  FYYTabBar.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYYTabBar : UIView

typedef enum : NSUInteger {
    FYYTabBarShow = 100,
    FYYTabBarMe,
    FYYTabBarLaunch = 1000,
} FYYTabBarType;

typedef void(^TabBarBlock)(FYYTabBar *tabbar, FYYTabBarType idx);

//*  回调的block  */
@property (nonatomic, copy) TabBarBlock tabBlock;

@end
