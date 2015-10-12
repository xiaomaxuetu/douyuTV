//
//  RecommendCollectionReusableView.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "RecommendCollectionReusableView.h"

#import "LoadMoreViewController.h"

@implementation RecommendCollectionReusableView

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithModel:(RecmdCategoryModel *)model {
    self.titleLabel.text = model.title;
}

- (IBAction)loadMoreClick:(UIButton *)sender {
    LoadMoreViewController *loadMoreVC = [[LoadMoreViewController alloc] init];
    loadMoreVC.cate_id = self.cate_id;
    loadMoreVC.detailTitle   = self.title;
    loadMoreVC.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:loadMoreVC animated:YES];
}

@end
