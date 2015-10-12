//
//  CategoryCollectionViewCell.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithModel:(RoomlistModel *)model {
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.room_src] placeholderImage:[UIImage imageNamed:@"Img_default@2x"]];
    self.roomNameLabel.text = model.room_name;
    self.nicknameLabel.text = model.nickname;
    
    float online = [model.online floatValue];
    if (online >= 10000) {
        self.onLineLabel.text   = [NSString stringWithFormat:@"%0.1f万",online/10000];
    }else {
        self.onLineLabel.text   = [NSString stringWithFormat:@"%0.0f",online];
    }
    
}


@end
