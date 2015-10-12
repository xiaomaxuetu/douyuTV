//
//  TabBarModel.h
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TabBarModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *normalImageName;
@property(nonatomic,copy)NSString *selectedImageName;

+(instancetype)modelWithTitle:(NSString*)title normalImage:(NSString*)normalImageName selectedImage:(NSString*)selectedImageName;

- (id)initWithTitle:(NSString*)title normalImage:(NSString*)normalImageName selectedImage:(NSString*)selectedImageName;

- (UIImage*)normalImage;
- (UIImage*)selectedImage;


@end
