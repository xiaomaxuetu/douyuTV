//
//  BaseViewController.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//
#import <UIKit/UIKit.h>
//用来方便后期定义每个页面的不同的NavigationBar上的不同元素
typedef NS_ENUM(NSInteger, DouFishTV) {
    
    DouFishTVDefult =0,
    DouFishTVBackAndTitle =1,
    DouFishTVTitle =2,

};

@interface BaseViewController : UIViewController
@property(nonatomic)DouFishTV douFishTV;
//留给子类重写
-(void)creatNavTitleText:(UILabel *)lable;
-(void)creatNavTitle;
@end
