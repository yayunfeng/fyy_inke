//
//  FYYUserHelper.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/22.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYYUserHelper : NSObject

//*    */
@property (nonatomic, strong) NSString *userName;

//*    */
@property (nonatomic, strong) NSString *imgUrl;

+ (instancetype)sharedMange;

+ (BOOL)isAutoLogin;

+ (void)saveUser;


@end
