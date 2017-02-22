//
//  FYYLocationManger.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/20.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^LocationBlock)(NSString *lat,NSString *lon);

@interface FYYLocationManger : NSObject

//*    */
@property (nonatomic, copy) NSString *lat;

//*    */
@property (nonatomic, copy) NSString *lon;

+ (instancetype)sharedManger;

- (void)getGps:(LocationBlock)block;
@end
