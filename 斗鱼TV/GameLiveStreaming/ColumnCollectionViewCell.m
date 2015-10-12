//
//  ColumnCollectionViewCell.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "ColumnCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface ColumnCollectionViewCell ()
@property(nonatomic)ColumnModel *model;

@end
@implementation ColumnCollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.ColumnIMageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-30)];
        [self addSubview:self.ColumnIMageView];
        
        self.ColumnLable = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-30, frame.size.width, 30)];
        self.ColumnLable.textAlignment = NSTextAlignmentCenter;
        self.ColumnLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.ColumnLable];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateWithColumnModel:(ColumnModel*)model {
    self.model = model;
    [self.ColumnIMageView sd_setImageWithURL:[NSURL URLWithString:model.game_icon]];
    self.ColumnLable.text = model.game_name;
}

@end
