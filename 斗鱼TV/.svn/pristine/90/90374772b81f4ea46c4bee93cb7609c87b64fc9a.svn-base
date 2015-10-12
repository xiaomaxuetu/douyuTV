//
//  ColumnViewController.m
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "ColumnViewController.h"
#import "ColumnCollectionViewCell.h"
#import "ColumnModel.h"
#import "LiveViewController.h"
#define COLUMN_URL @"http://www.douyutv.com/api/v1/live/%ld?aid=ios&auth=79ba518f50373672b6cf50969641b552&client_sys=ios&limit=20&offset=%d&time=1444008780"
@interface ColumnViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic)UICollectionView *collectionView;
@property(nonatomic)BOOL isRefreshing;
@property(nonatomic)NSMutableArray *ColumnDataArray;

@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self fetchAppDataFromServer];
    [self createCollectionView];
    [self createRefreshHeadView];
    self.isRefreshing = YES;

}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.douFishTV =DouFishTVDefult;
    }
    return self;
}
#pragma mark -
#pragma mark crecreateCollectionViewate
- (void)createCollectionView
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //定义cell的大小
    //layout.itemSize = CGSizeMake(375, 667);
    
    layout.itemSize = CGSizeMake((self.view.frame.size.width-40)/3, 610.0/440*((self.view.frame.size.width-40)/3)+30);
    
    //sectionInset 设置区的内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //设置2个item之间的最小间隙，
    layout.minimumInteritemSpacing = 10;
    
    //设置行之间的最小间距
    layout.minimumLineSpacing      = 10;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    
    //注册要使用的cell对应的类型
    self.collectionView.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0];
    [self.collectionView registerClass:[ColumnCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    
    [self.view addSubview:self.collectionView];
}
#pragma mark -
#pragma mark 下载
- (void)fetchAppDataFromServer {
    NSString *url = @"http://www.douyutv.com/api/v1/game?aid=ios&auth=5fb0be4609cad468cd3f9326189e280c&client_sys=ios&time=1443834780";
    [[NetDataEngine sharedInstance]requestColumnFrom:url success:^(id responsData) {
        
        [self parseRespondData:responsData];
        [self.collectionView reloadData];
        [self endRefreshing];
    } failed:^(NSError *error) {
        
        [self endRefreshing];
    }];
    
}
- (void)parseRespondData:(id)responsData {
    if (self.isRefreshing == YES) {
        [self.ColumnDataArray removeAllObjects];
        self.ColumnDataArray = (NSMutableArray*)[ColumnModel parseRespondColumnData:(NSDictionary*)responsData];
    }
}
- (void)endRefreshing
{
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.collectionView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    
}
#pragma mark -
#pragma mark 刷新
- (void)createRefreshHeadView
{
    __weak typeof(self)weakSelf = self;
    [self.collectionView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        weakSelf.isRefreshing = YES;
        [weakSelf fetchAppDataFromServer];
    }];
}
#pragma mark -
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.ColumnDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ColumnCollectionViewCell *cell = (ColumnCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    ColumnModel *model = [self.ColumnDataArray objectAtIndex:indexPath.row];
    [cell updateWithColumnModel:model];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LiveViewController *liveViewController = [[LiveViewController alloc]init];
    liveViewController.url = [NSString stringWithFormat:COLUMN_URL,indexPath.item+1,2];
    liveViewController.douFishTV = DouFishTVBackAndTitle;
    liveViewController.hidesBottomBarWhenPushed = YES;
   ColumnModel *column = [self.ColumnDataArray objectAtIndex:indexPath.item];
    liveViewController.detailTitle =column.game_name;
    [self.navigationController pushViewController:liveViewController animated:YES];
    //当选中某一个cell（item）时调用的代理方法
    NSLog(@"(%ld,%ld)",indexPath.section,indexPath.item);
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
