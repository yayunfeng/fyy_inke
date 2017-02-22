//
//  AppDelegate+UMeng.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/22.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "AppDelegate+UMeng.h"

@implementation AppDelegate (UMeng)

- (void)setupUmeng {
    
    //设置umengkey
    [UMSocialData setAppKey:@"57a5581267e58e2557001639"];
    //RedirectURL 授权回调页
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2892166685"
                                              secret:@"7849eb7a9922c4318b1a0cff9a215ff3"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
}

@end
