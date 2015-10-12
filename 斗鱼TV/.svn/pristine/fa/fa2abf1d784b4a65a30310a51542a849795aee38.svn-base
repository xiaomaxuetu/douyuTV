//
//  RoomlistModel.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "JSONModel.h"

@protocol RoomlistModel
@end

@interface RoomlistModel : JSONModel

@property (nonatomic,copy) NSString *room_src;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSNumber *online;
@property (nonatomic,copy) NSString *room_name;


@property (nonatomic,copy) NSString <Optional> *room_id;
@property (nonatomic,copy) NSString <Optional> *cate_id;
@property (nonatomic,copy) NSString <Optional> *show_status;
@property (nonatomic,copy) NSString <Optional> *subject;
@property (nonatomic,copy) NSString <Optional> *show_time;
@property (nonatomic,copy) NSString <Optional> *owner_uid;
@property (nonatomic,copy) NSString <Optional> *specific_catalog;
@property (nonatomic,copy) NSString <Optional> *specific_status;
@property (nonatomic,copy) NSString <Optional> *vod_quality;
@property (nonatomic,copy) NSString <Optional> *url;
@property (nonatomic,copy) NSString <Optional> *game_url;
@property (nonatomic,copy) NSString <Optional> *game_name;


+ (NSArray *)parseResponsDataWithRoolistModel:(id)responsData;

@end



//"room_id": "4809",
//"room_src": "http://staticlive.douyutv.com/upload/web_pic/9/4809_1510051013_thumb.jpg",
//"cate_id": "1",
//"room_name": "幻影 金克斯打野~V3 火箭炮！",
//"show_status": "1",
//"subject": "",
//"show_time": "1444004587",
//"owner_uid": "184165",
//"specific_catalog": "",
//"specific_status": "1",
//"vod_quality": "0",
//"nickname": "饼干狂魔MasterB",
//"online": 1563105,
//"url": "/4809",
//"game_url": "/directory/game/LOL",
//"game_name": "英雄联盟"
