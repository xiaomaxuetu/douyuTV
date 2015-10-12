//
//  RootAutoScrollModel.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/7.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "JSONModel.h"

#import "AutoScrollModel.h"

@interface RootAutoScrollModel : JSONModel

@property (nonatomic,copy) NSString *error;
@property (nonatomic,copy) NSArray <AutoScrollModel> *data;

+ (NSArray *)parseResponsData:(id)responsData;

@end





