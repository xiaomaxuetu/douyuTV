//
//  NetDataEngine.h
//  LimitFree
//
//  Created by lijinghua on 15/9/12.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlockType) (id responsData);
typedef void(^FailedBlockType)(NSError *error);

@interface NetDataEngine : NSObject

+ (instancetype)sharedInstance;


- (void)requestLiveFrom:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;

- (void)requestColumnFrom:(NSString*)url success:(SuccessBlockType)successBlock failed:(FailedBlockType)failedBlock;

- (void)requestSearchFrom:(NSString*)url success:(SuccessBlockType)successBlock failed:(FailedBlockType)failedBlock;

@end
