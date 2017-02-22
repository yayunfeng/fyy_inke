//
//  FYYHotHandle.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/18.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYBaseHander.h"

@interface FYYHotHandle : FYYBaseHander


//处理首页请求
+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum success:(SuccessBlock)success failed:(FailedBlock)failed;


//处理附近请求
+ (void)executeGetNearLiveTaskWithPage:(NSInteger)pageNum success:(SuccessBlock)success failed:(FailedBlock)failed;

//处理广告请求
+ (void)executeGetAdeversizeTaskWithPage:(NSInteger)pageNum success:(SuccessBlock)success failed:(FailedBlock)failed;


@end
