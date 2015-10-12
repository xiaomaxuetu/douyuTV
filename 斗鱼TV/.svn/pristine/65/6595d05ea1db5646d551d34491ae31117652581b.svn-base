//
//  RoomlistModel.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "RoomlistModel.h"

@implementation RoomlistModel

+ (NSArray *)parseResponsDataWithRoolistModel:(id)responsData {
    NSMutableArray *array = [NSMutableArray array];
    NSArray *arr = responsData[@"data"];
    for (NSDictionary *dic in arr) {
        RoomlistModel *model = [[RoomlistModel alloc] initWithDictionary:dic error:nil];
        [array addObject:model];
    }
    return array;
}

@end
