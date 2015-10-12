//
//  ColumnCollectionViewCell.h
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnModel.h"
@interface ColumnCollectionViewCell : UICollectionViewCell
@property (nonatomic)UIImageView *ColumnIMageView;
@property (nonatomic)UILabel *ColumnLable;
- (void)updateWithColumnModel:(ColumnModel*)model;
@end
