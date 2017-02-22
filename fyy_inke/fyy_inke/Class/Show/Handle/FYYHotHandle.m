//
//  FYYHotHandle.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/18.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYHotHandle.h"
#import "HttpTool.h"
#import "FYYLive.h"
#import "FYYAdvertise.h"

@implementation FYYHotHandle

//处理首页数据
+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum success:(SuccessBlock)success failed:(FailedBlock)failed{
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        NSInteger error = [json[@"dm_error"] integerValue];
        if (!error) {
            NSArray *lives = [FYYLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }else{
             failed(json);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
}
+ (void)executeGetNearLiveTaskWithPage:(NSInteger)pageNum success:(SuccessBlock)success failed:(FailedBlock)failed {
    NSDictionary * params = @{@"uid":@"85149891",
                              @"latitude":@"40.090562",
                              @"longitude":@"116.413353"
                              };
    [HttpTool getWithPath:API_NearLocation params:params success:^(id json) {
        
        NSInteger error = [json[@"dm_error"] integerValue];
        
        if (!error) {
            
            NSArray * lives = [FYYLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
        
        failed(error);
    }];

}
+ (void)executeGetAdeversizeTaskWithPage:(NSInteger)pageNum success:(SuccessBlock)success failed:(FailedBlock)failed {
    [HttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        NSInteger error = [json[@"dm_error"] integerValue];
        
        if (!error) {
            
            FYYAdvertise * adver = [FYYAdvertise mj_objectWithKeyValues:json[@"resources"][0]];
            
            success(adver);
            
        } else {
            
            failed(json);
            
        }
    } failure:^(NSError *error) {
         failed(error);
    }];
}

@end
