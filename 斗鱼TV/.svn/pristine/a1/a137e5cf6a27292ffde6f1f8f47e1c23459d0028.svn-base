//
//  NetDataEngine.m
//  LimitFree
//
//  Created by lijinghua on 15/9/12.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import "NetDataEngine.h"

#import "AFNetworking.h"

@interface NetDataEngine()
@property(nonatomic)AFHTTPRequestOperationManager *manager;
@end

@implementation NetDataEngine

+ (instancetype)sharedInstance
{
    static NetDataEngine *s_netEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_netEngine = [[NetDataEngine alloc]init];
    });
    return s_netEngine;
}

- (id)init{
    if (self = [super init]) {
        self.manager = [[AFHTTPRequestOperationManager alloc]init];
        //增加新的类型text/html
        NSSet *currentAcceptSet = self.manager.responseSerializer.acceptableContentTypes;
        NSMutableSet *mset = [NSMutableSet setWithSet:currentAcceptSet];
        [mset addObject:@"text/html"];
        self.manager.responseSerializer.acceptableContentTypes = mset;
    }
    return self;
}

- (void)GET:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock{
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
    }];
}
         
- (void)requestLiveFrom:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock{
    [self GET:url success:successBlock falied:failedBlock];
}

- (void)requestColumnFrom:(NSString*)url success:(SuccessBlockType)successBlock failed:(FailedBlockType)failedBlock  {
    [self GET:url success:successBlock falied:failedBlock];
}

- (void)requestSearchFrom:(NSString*)url success:(SuccessBlockType)successBlock failed:(FailedBlockType)failedBlock {

    [self GET:url success:successBlock falied:failedBlock];




}
    



@end
