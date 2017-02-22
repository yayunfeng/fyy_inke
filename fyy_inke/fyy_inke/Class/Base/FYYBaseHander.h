//
//  FYYBaseHander.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/18.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <Foundation/Foundation.h>
//请求完成block
typedef void(^CompetionBlock)();

//请求成功block
typedef void(^SuccessBlock)(id obj);
//请求失败回调block
typedef void(^FailedBlock)(id obj);
@interface FYYBaseHander : NSObject

@end
