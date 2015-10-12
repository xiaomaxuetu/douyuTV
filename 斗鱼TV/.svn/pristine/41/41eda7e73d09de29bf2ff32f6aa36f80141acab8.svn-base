//
//  GLSDBManager.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/6.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoomlistModel.h"
@interface GLSDBManager : NSObject
+ (instancetype)sharedInstance;

//type ：浏览，下载，收藏
//添加
- (void)addAppInfo:(NSString *)name type:(NSString*)type;

//删除
- (void)deleteAppInfo:(NSString*)name type:(NSString*)type;

//根据type读取AppInfo的列表
- (NSArray*)readAppInfoList:(NSString*)type;

//判断类型为type的app 是否存在表中
- (BOOL)isAppInfoExists:(NSString*)name type:(NSString*)type;
@end
