//
//  ColumnModel.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColumnModel : NSObject
@property(nonatomic)NSString *cate_id;
@property(nonatomic)NSString *game_name;
@property(nonatomic)NSString *short_name;
@property(nonatomic)NSString *game_url;
@property(nonatomic)NSString *game_src;
@property(nonatomic)NSString *game_icon;
@property(nonatomic)NSString *online_room;
@property(nonatomic)NSString *online_room_ios;
+ (NSArray *)parseRespondColumnData:(NSDictionary *)respondData;
//"data": [
//         {
//             "cate_id": "1",
//             "game_name": "英雄联盟",
//             "short_name": "LOL",
//             "game_url": "/directory/game/LOL",
//             "game_src": "http://staticlive.douyutv.com/upload/game_cate/c543faae97189c529c37b7741906d5a1.jpg",
//             "game_icon": "http://staticlive.douyutv.com/upload/game_cate/03f34b23c3b92aebddc99fb1a307a4df.jpg",
//             "online_room": "313",
//             "online_room_ios": "24"
//         },
@end
