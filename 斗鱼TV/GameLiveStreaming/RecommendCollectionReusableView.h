//
//  RecommendCollectionReusableView.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CategoryHeadCollectionReusableView.h"

@interface RecommendCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UICollectionView *recommendCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondIconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic,copy) NSString *cate_id;
@property (nonatomic,copy) NSString *title;
@property (nonatomic) UIViewController *viewController;


@property (weak, nonatomic) IBOutlet UIView *ScrollFromView;


- (void)updateWithModel:(RecmdCategoryModel *)model;

@end
