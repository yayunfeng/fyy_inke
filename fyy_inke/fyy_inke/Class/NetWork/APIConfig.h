//
//  APIConfig.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/18.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

#define SERVER_HOST @"http://service.ingkee.com"

#define IMAGE_HOST @"http://img.meelive.cn/"

//首页数据

#define API_LiveGetTop @"api/live/gettop"

//广告地址

#define API_Advertise @"advertise/get"

//热门话题

#define API_TopicIndex @"api/live/topicindex"

//附近的人

#define API_NearLocation @"api/live/near_recommend"//?uid=85149891&latitude=40.090562&longitude=116.413353


//欢歌直播

#define Live_FYY @"rtmp://live.hkstv.hk.lxdns.com:1935/live/yyfeng"


@end
