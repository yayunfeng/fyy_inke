//
//  FYYLocationManger.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/20.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYLocationManger.h"

#import <CoreLocation/CoreLocation.h>

@interface FYYLocationManger()<CLLocationManagerDelegate>

//*    */
@property (nonatomic, strong) CLLocationManager *manger;

//*    */
@property (nonatomic, copy) LocationBlock block;

@end

@implementation FYYLocationManger

+ (instancetype)sharedManger{
    static FYYLocationManger *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[FYYLocationManger alloc] init];
    });
    return _manager;
}


- (instancetype)init{
    if (self = [super init]) {
        _manger = [[CLLocationManager alloc] init];
        [_manger setDesiredAccuracy:kCLLocationAccuracyBest];
        _manger.distanceFilter = 100;
        _manger.delegate = self;
        if (![CLLocationManager locationServicesEnabled]) {
            //开启服务
        }else{
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            //前台的时候在使用
            if (status == kCLAuthorizationStatusNotDetermined) {
                [_manger requestWhenInUseAuthorization];
            }
        }
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    CLLocationCoordinate2D coor = newLocation.coordinate;
    NSString *lat = [NSString stringWithFormat:@"%@",@(coor.latitude)];
     NSString *lon = [NSString stringWithFormat:@"%@",@(coor.longitude)];
    [FYYLocationManger sharedManger].lat = lat;
    [FYYLocationManger sharedManger].lon = lon;
    !self.block?:self.block(lat,lon);
    [_manger stopUpdatingLocation];
}

- (void)getGps:(LocationBlock)block {
    self.block = block;
    [_manger startUpdatingLocation];
}


@end
