//
//  FYYLive.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/18.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FYYCreator.h"

@interface FYYLive : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) FYYCreator * creator;
@property (nonatomic, assign) NSInteger group;
//id改成ID了
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;

@property (nonatomic, strong) NSString * distance;

@property (nonatomic, assign ,getter=isShow) BOOL show;

@end
