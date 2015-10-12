//
//  LoadMoreViewController.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "LoadMoreViewController.h"

#import "RoomlistModel.h"
#import "CategoryCollectionViewCell.h"
#import "PlayerViewController.h"

#define collectionViewCellId @"categoryCollectionCellId"

@interface LoadMoreViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic,copy) NSArray     *dataSource;

@property (nonatomic) BOOL isRefreshing;

@end

@implementation LoadMoreViewController

- (id)init {
    if (self = [super init]) {
        self.douFishTV = DouFishTVBackAndTitle;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createCollectionView];
    [self createRefreshView];
    [self fetchData];
}

- (void)createCollectionView {
    CGFloat itemWidth  = (kScreenWidth-3*5)/2.0;
    CGFloat itemHeight = itemWidth/3.0*2;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing      = 5;
    flowLayout.itemSize = CGSizeMake( itemWidth, itemHeight);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    
    UINib *nib = [UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:collectionViewCellId];
    
    [self.view addSubview:self.collectionView];
}

-(void)creatNavTitleText:(UILabel *)lable {
    lable.text =self.detailTitle;
}

#pragma mark -
#pragma mark 添加刷新

- (void)createRefreshView {
    
    __weak typeof(self)weakSelf = self;
    [self.collectionView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.isRefreshing = YES;
        [weakSelf fetchData];
    }];
}

- (void)endRefreshing {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.collectionView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
}

#pragma mark-
#pragma mark 网络请求

- (NSString *)composeRequestUrl {
    return [NSString stringWithFormat:kLoadMoreUrl,self.cate_id];
}

- (void)fetchData {
    NSString *url = [self composeRequestUrl];
    [[NetDataEngine sharedInstance] requestLiveFrom:url success:^(id responsData) {
        self.dataSource = [RoomlistModel parseResponsDataWithRoolistModel:responsData];
        [self.collectionView reloadData];
        [self endRefreshing];
    } falied:^(NSError *error) {
        NSLog(@"%@",error);
        [self endRefreshing];
    }];
}

#pragma mark -
#pragma mark UICollectionView代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
    RoomlistModel *model = self.dataSource[indexPath.row];
    [cell updateWithModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //跳转直播
    RoomlistModel *roomlistModel = self.dataSource[indexPath.row];
    PlayerViewController *playerVC = [[PlayerViewController alloc] init];
    playerVC.roomId = roomlistModel.room_id;
    [self.navigationController pushViewController:playerVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
