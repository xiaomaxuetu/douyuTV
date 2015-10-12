//
//  RecommendCollectionViewCell.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RoomlistModel.h"

@interface RecommendCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;


- (void)updateWithModel:(RoomlistModel *)model;

@end
