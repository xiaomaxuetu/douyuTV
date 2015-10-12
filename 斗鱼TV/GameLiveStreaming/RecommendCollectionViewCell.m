//
//  RecommendCollectionViewCell.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "RecommendCollectionViewCell.h"

@implementation RecommendCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithModel:(RoomlistModel *)model {
    self.iconImageView.layer.cornerRadius  = 30;
    self.iconImageView.layer.masksToBounds = YES;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.room_src] placeholderImage:[UIImage imageNamed:@"Image_head@2x"]];
    self.nameLabel.text = model.nickname;
    self.gameLabel.text = model.game_name;
}

@end
