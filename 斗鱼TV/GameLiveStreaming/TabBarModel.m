//
//  TabBarModel.m
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "TabBarModel.h"

@implementation TabBarModel
+(instancetype)modelWithTitle:(NSString*)title normalImage:(NSString*)normalImageName selectedImage:(NSString*)selectedImageName
{
    return [[self alloc] initWithTitle:title normalImage:normalImageName selectedImage:selectedImageName];
}

- (id)initWithTitle:(NSString*)title normalImage:(NSString*)normalImageName selectedImage:(NSString*)selectedImageName
{
    if (self = [super init]) {
        _title             = title;
        _normalImageName   = normalImageName;
        _selectedImageName = selectedImageName;
    }
    return self;
}

- (UIImage*)normalImage
{
    return [UIImage imageNamed:self.normalImageName];
}

- (UIImage*)selectedImage
{
    return [[UIImage imageNamed:self.selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
