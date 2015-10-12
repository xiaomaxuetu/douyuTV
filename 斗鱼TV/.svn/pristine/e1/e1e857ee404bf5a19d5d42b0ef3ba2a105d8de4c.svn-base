//
//  ColumnModel.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "ColumnModel.h"

@implementation ColumnModel
+ (NSArray *)parseRespondColumnData:(NSDictionary *)respondData {
    NSMutableArray *columnArray = [NSMutableArray array];
    NSArray *dataArray = respondData[@"data"];
    for (NSDictionary *dic in dataArray) {
        ColumnModel *model = [[ColumnModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [columnArray addObject:model];
    }
    //    NSLog(@"%@",funArray);
    return columnArray;
    
}
@end
