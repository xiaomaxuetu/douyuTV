//
//  RecmdCategoryModel.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "RecmdCategoryModel.h"

@implementation RecmdCategoryModel

+ (NSArray *)parseResponsData:(id)responsData {
    NSMutableArray *array = [NSMutableArray array];
    NSArray *arr = responsData[@"data"];
    for (NSDictionary *dic in arr) {
        RecmdCategoryModel *model = [[RecmdCategoryModel alloc] initWithDictionary:dic error:nil];
        [array addObject:model];
    }
    return array;
}

@end
