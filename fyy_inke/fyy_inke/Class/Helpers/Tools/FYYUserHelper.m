//
//  FYYUserHelper.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/22.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYUserHelper.h"

@interface FYYUserHelper ()

@end

@implementation FYYUserHelper

+ (instancetype)sharedMange {
    static FYYUserHelper *_user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _user = [[FYYUserHelper alloc] init];
    });
    return _user;
}

- (instancetype)init {
    if (self = [super init]) {
        _userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
        _imgUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"imgUrl"];
    }
    return self;
}

+ (BOOL)isAutoLogin{
    if ([FYYUserHelper sharedMange].userName.length == 0) {
        return NO;
    }
    return YES;
}

+ (void)saveUser {
    [[NSUserDefaults standardUserDefaults] setObject:[FYYUserHelper sharedMange].userName forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:[FYYUserHelper sharedMange].imgUrl forKey:@"imgUrl"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
