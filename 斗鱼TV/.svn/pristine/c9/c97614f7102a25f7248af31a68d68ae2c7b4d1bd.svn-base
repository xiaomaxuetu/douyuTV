//
//  RecommendViewController.m
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "RecommendViewController.h"

#import "RecommendCollectionViewCell.h"
#import "CategoryCollectionViewCell.h"

#import "RecommendCollectionReusableView.h"
#import "CategoryHeadCollectionReusableView.h"

#import "RecmdCategoryModel.h"
#import "RootAutoScrollModel.h"

#import "PlayerViewController.h"

#import "AutoScrollView.h"

#define categoryCollectionCellId  @"categoryCollectionCellId"
#define recommendCollectionCellId @"recommendCollectionCellId"
#define recommendHeaderId         @"recommendHeaderId"
#define categoryHeaderId          @"sectionHeaderId"

@interface RecommendViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *categoryCollectionView;     //分类collectionView
@property (nonatomic,copy) NSArray     *categoryDataSource;


@property (nonatomic) UICollectionView *recommendCollectionView;  //新秀推荐collectionView
@property (nonatomic,copy) NSArray     *recommendDataSource;

@property (nonatomic) BOOL isRefreshing;

@property (nonatomic) AutoScrollView *autoScrollView;
@property (nonatomic,copy) NSArray   *scrollArr;
@property (nonatomic) NSMutableArray *imageArr;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.imageArr = [NSMutableArray array];
    [self createCategoryCollectionView];
    [self createRefreshView];
    [self fetchData];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.douFishTV =DouFishTVDefult;
    }
    return self;
}
- (void)createCategoryCollectionView {
    
    CGFloat itemWidth  = (kScreenWidth-3*5)/2.0;
    CGFloat itemHeight = itemWidth/3.0*2;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing      = 5;
    flowLayout.itemSize = CGSizeMake( itemWidth, itemHeight);
    flowLayout.headerReferenceSize = CGSizeMake(0, 30);
    
    
    self.categoryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49) collectionViewLayout:flowLayout];
    self.categoryCollectionView.backgroundColor = [UIColor whiteColor];
    self.categoryCollectionView.dataSource = self;
    self.categoryCollectionView.delegate   = self;
    
    UINib *nib = [UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil];
    [self.categoryCollectionView registerNib:nib forCellWithReuseIdentifier:categoryCollectionCellId];
    
    UINib *nib2 = [UINib nibWithNibName:@"CategoryHeadCollectionReusableView" bundle:nil];
    [self.categoryCollectionView registerNib:nib2 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:categoryHeaderId];
    
    UINib *nib3 = [UINib nibWithNibName:@"RecommendCollectionReusableView" bundle:nil];
    [self.categoryCollectionView registerNib:nib3 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:recommendHeaderId];
    
    
    [self.view addSubview:self.categoryCollectionView];
}

- (void)createRecommendCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing      = 5;
    flowLayout.itemSize = CGSizeMake(70, 105);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.recommendCollectionView.bounces = NO;
    self.recommendCollectionView.backgroundColor = [UIColor whiteColor];
    self.recommendCollectionView.collectionViewLayout = flowLayout;
    self.recommendCollectionView.dataSource = self;
    self.recommendCollectionView.delegate   = self;
    
    UINib *nib = [UINib nibWithNibName:@"RecommendCollectionViewCell" bundle:nil];
    [self.recommendCollectionView registerNib:nib forCellWithReuseIdentifier:recommendCollectionCellId];
}

- (void)createAutoScrollView {
    NSMutableArray *array = [NSMutableArray array];
    for (int index = 0; index < self.scrollArr.count; index++) {
        AutoScrollModel *model = self.scrollArr[index];
        [array addObject:model.room.room_id];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [self.imageArr addObject:imageView.image];
            if (self.imageArr.count == self.scrollArr.count) {
                self.autoScrollView = [[AutoScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, (kScreenWidth-20)/2.0) imageArray:self.imageArr];
                self.autoScrollView.roomIdArr = array;
                self.autoScrollView.viewController = self;
                [self.categoryCollectionView reloadData];
            }
        }];
    }
}



#pragma mark -
#pragma mark 添加刷新

- (void)createRefreshView {
    __weak typeof(self)weakSelf = self;
    [self.categoryCollectionView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.isRefreshing = YES;
        [weakSelf fetchData];
    }];
    
}

- (void)endRefresh {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.categoryCollectionView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
}

#pragma mark -
#pragma mark 网络请求

- (void)fetchData {
    //新秀推荐
    [[NetDataEngine sharedInstance] requestLiveFrom:kRecommendUrl success:^(id responsData) {
        self.recommendDataSource = [RoomlistModel parseResponsDataWithRoolistModel:responsData];
        [self.recommendCollectionView reloadData];
    } falied:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    //直播分类
    [[NetDataEngine sharedInstance] requestLiveFrom:kRecmdCategoryUrl success:^(id responsData) {
        self.categoryDataSource = [RecmdCategoryModel parseResponsData:responsData];
        [self.categoryCollectionView reloadData];
        [self endRefresh];
    } falied:^(NSError *error) {
        NSLog(@"%@",error);
        [self endRefresh];
    }];
    //滚动图
    [[NetDataEngine sharedInstance] requestLiveFrom:KSlideUrl success:^(id responsData) {
        self.scrollArr = [RootAutoScrollModel parseResponsData:responsData];
        [self createAutoScrollView];
    } falied:^(NSError *error) {
        NSLog(@"%@",error);
    }];;
    
}


#pragma mark -
#pragma mark UICollectionView代理

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (collectionView == self.categoryCollectionView) {
        return self.categoryDataSource.count;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.categoryCollectionView) {
        RecmdCategoryModel *recmdCategoryModel = self.categoryDataSource[section];
        return recmdCategoryModel.roomlist.count;
    }
    return self.recommendDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.categoryCollectionView) {
        CategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:categoryCollectionCellId forIndexPath:indexPath];
        RecmdCategoryModel *recmdCategoryModel = self.categoryDataSource[indexPath.section];
        RoomlistModel *roomlistModel = recmdCategoryModel.roomlist[indexPath.row];
        [cell updateWithModel:roomlistModel];
        return cell;
    }else {
        RecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendCollectionCellId forIndexPath:indexPath];
        RoomlistModel *roomlistModel = self.recommendDataSource[indexPath.row];
        [cell updateWithModel:roomlistModel];
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.categoryCollectionView && kind ==UICollectionElementKindSectionHeader) {
        RecmdCategoryModel *recmdCategoryModel = self.categoryDataSource[indexPath.section];
            if (indexPath.section == 0) {
                RecommendCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:recommendHeaderId forIndexPath:indexPath];
                self.recommendCollectionView = headView.recommendCollectionView;
                [headView updateWithModel:recmdCategoryModel];
                [self createRecommendCollectionView];
                
                headView.iconImageView.layer.cornerRadius = 3;
                headView.iconImageView.layer.masksToBounds = YES;
                headView.secondIconImageView.layer.cornerRadius = 3;
                headView.secondIconImageView.layer.masksToBounds = YES;
                
                headView.cate_id = recmdCategoryModel.cate_id;
                headView.title   = recmdCategoryModel.title;
                headView.viewController = self;
                
                if (headView.ScrollFromView.subviews != 0) {
                    for (UIView *view  in headView.ScrollFromView.subviews) {
                        [view removeFromSuperview];
                    }
                }
                [headView.ScrollFromView addSubview:self.autoScrollView];
                
                return headView;
            }
            
        CategoryHeadCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:categoryHeaderId forIndexPath:indexPath];
        [headView updateWithModel:recmdCategoryModel];
        
        headView.iconImageView.layer.cornerRadius = 3;
        headView.iconImageView.layer.masksToBounds = YES;
        
        headView.cate_id = recmdCategoryModel.cate_id;
        headView.title   = recmdCategoryModel.title;
        headView.viewController = self;
        
        return headView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (collectionView == self.categoryCollectionView) {
        if (section == 0) {
            return CGSizeMake(0, 160+kScreenWidth/2.0);
        }
        return CGSizeMake(0, 30);
    }
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //跳转直播
    if (collectionView == self.categoryCollectionView) {
        RecmdCategoryModel *recmdCategoryModel = self.categoryDataSource[indexPath.section];
        RoomlistModel *roomlistModel = recmdCategoryModel.roomlist[indexPath.row];
        PlayerViewController *playerVC = [[PlayerViewController alloc] init];
        playerVC.roomId = roomlistModel.room_id;
        [self.navigationController pushViewController:playerVC animated:YES];
    }else {
        RoomlistModel *roomlistModel = self.recommendDataSource[indexPath.row];
        PlayerViewController *playerVC = [[PlayerViewController alloc] init];
        playerVC.roomId = roomlistModel.room_id;
        [self.navigationController pushViewController:playerVC animated:YES];
    }
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
