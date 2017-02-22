//
//  MJExtensionConfig.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/18.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "FYYCreator.h"
#import "FYYLive.h"

@implementation MJExtensionConfig

+ (void)load {
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    
    [FYYCreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"desciption"
                 };
    }];
    //下划线的处理
    [FYYLive mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [FYYCreator mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
