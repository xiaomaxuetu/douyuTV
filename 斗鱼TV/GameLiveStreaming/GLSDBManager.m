//
//  GLSDBManager.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/6.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "GLSDBManager.h"
#import "FMDatabase.h"
@interface GLSDBManager()
{
    FMDatabase *_db;   //数据库实例
}
@end
@implementation GLSDBManager

+ (instancetype)sharedInstance
{
    static GLSDBManager *s_dbManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_dbManager = [[GLSDBManager alloc]init];
    });
    return s_dbManager;
}

- (NSString*)dbPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchTV.db"];
}

- (id)init{
    if (self = [super init]) {
        NSLog(@"dbPath = %@",[self dbPath]);
        _db  = [[FMDatabase alloc]initWithPath:[self dbPath]];
        if ([_db open]) {
            [self createTable];
        }
    }
    return self;
}

- (void)createTable
{
    NSString *sql = @"create table if not exists appInfo(name string)";
    if (![_db executeUpdate:sql]) {
        NSLog(@"创建表失败");
    }
}

//type ：浏览，下载，收藏
//添加
- (void)addAppInfo:(NSString *)name type:(NSString*)type
{
    NSString *sql = @"insert into appInfo(name) values(?)";
    if (![_db executeUpdate:sql,name]) {
        NSLog(@"插入记录失败");
    }
}

//删除
- (void)deleteAppInfo:(NSString *)name type:(NSString*)type
{
    NSString *sql = @"delete from appInfo where name = ?";
    if (![_db executeUpdate:sql,name]) {
        NSLog(@"删除数据失败");
    }
}

//根据type读取AppInfo的列表
- (NSArray*)readAppInfoList:(NSString*)type
{
    NSMutableArray *appArray = [NSMutableArray array];
    NSString *sql = @"select * from appInfo";
    FMResultSet *resultSet = [_db executeQuery:sql];
    while (resultSet.next) {
        [appArray addObject:[resultSet stringForColumn:@"name"]];
    }
    [resultSet close];
    return appArray;
}

//判断类型为type的app 是否存在表中
- (BOOL)isAppInfoExists:(NSString *)name type:(NSString*)type{
    BOOL isExist = NO;
    NSString *sql = @"select * from appInfo where name = ?";
    FMResultSet *resultSet = [_db executeQuery:sql,name];
    if (resultSet.next) {
        isExist = YES;
    }
    [resultSet close];
    return isExist;
}


@end
