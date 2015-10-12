//
//  AutoScrollView.h
//  AutoScoll
//
//  Created by lijinghua on 15/8/19.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollView : UIView

@property (nonatomic,copy) NSArray *roomIdArr;     //点击滚动图跳转界面需要的url数据
@property (nonatomic) UIViewController *viewController;    //可以获得导航控制器的ViewController

- (id)initWithFrame:(CGRect)frame imageArray:(NSArray*)imageArray;



@end
