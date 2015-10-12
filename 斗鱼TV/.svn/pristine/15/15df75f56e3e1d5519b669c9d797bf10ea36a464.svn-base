//
//  SearchDetailViewController.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "RoomlistModel.h"
#import "CategoryCollectionViewCell.h"
#import "PlayerViewController.h"

@interface SearchDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic)UICollectionView *collectionView;
@property(nonatomic)NSMutableArray *dataSourcing;
@property(nonatomic)NSMutableArray *dataSourceNone;
//记录点击的是哪一个segmentController
@property(nonatomic)NSInteger index;
@end

@implementation SearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    [self customOtherView];
    [self customUICollectionLayout];
    
    
    
    // Do any additional setup after loading the view.
}
#pragma mark -
#pragma mark 重写父类的方法
-(void)creatNavTitleText:(UILabel *)lable {

    lable.text =self.keyword;
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.douFishTV=DouFishTVBackAndTitle;
        self.index =0;
        self.dataSourceNone =[NSMutableArray array];
        self.dataSourcing =[NSMutableArray array];
    }
    return self;
}
#pragma mark -
#pragma mark 定制其他的View
-(void)customOtherView {
    
    
    UISegmentedControl *segmentController = [[UISegmentedControl alloc]initWithItems:@[@"正在直播",@"未开播"]];
    segmentController.bounds =CGRectMake(0, 0, kScreenWidth -2*20, 30);
    segmentController.center =CGPointMake(kScreenWidth/2, 30);
    segmentController.tintColor =[UIColor orangeColor];
    
    [segmentController setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
    
    [segmentController setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    segmentController.selectedSegmentIndex =0;
    if (segmentController.selectedSegmentIndex ==0) {
    
        [self segmentedValueChanged:segmentController];
        
    }
    
//    [self.textStorage addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} range:NSMakeRange(0, TEXT.length)];
//    [self.textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:result.range];
    [segmentController addTarget:self action:@selector(segmentedValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentController];

}
- (void)customUICollectionLayout {
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset =UIEdgeInsetsMake(10, 10,0, 10);
    layout.minimumInteritemSpacing =5;
    layout.minimumLineSpacing =10;
    
    layout.itemSize =CGSizeMake((self.view.frame.size.width -10*2-5)/2, self.view.frame.size.height/5);
    
    
    self.collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, kScreenWidth, kScreenHeight -60) collectionViewLayout:layout];
    self.collectionView.backgroundColor =[UIColor orangeColor];
    self.collectionView.dataSource =self;
    self.collectionView.delegate =self;
    UINib *nib = [UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"categoryCollectionCellId"];
    [self.view addSubview:self.collectionView];
    
}

#pragma mark -
#pragma mark 网络链接有关的方法
-(NSString *)loadDataFromUrl {
    NSString *url=[NSString stringWithFormat:kSearchingUrl,self.keyword];
    
    //编码网址
    return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (void)segmentedValueChanged:(UISegmentedControl*)segment {

    self.index =segment.selectedSegmentIndex;
    NSString *UrlEnding =[[NSString alloc]init];
    if (self.index==0) {
        NSString *url =[NSString stringWithFormat:kSearchingUrl,self.keyword];
       UrlEnding =[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
    }else if (self.index ==1) {
        
        NSString *url =[NSString stringWithFormat:kSearchNoneUrl,self.keyword];
        UrlEnding =[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
         }
    [self fetchDataFromWhere:UrlEnding andIndex:self.index];
    

}
-(void)fetchDataFromWhere:(NSString *)Url andIndex:(NSInteger)index{
    if (![self fetchDataFromLocal]) {
        [self fetchDataFromServer:Url andIndex:index];
    }

}
-(BOOL)fetchDataFromLocal {

    return NO;

}
-(void)fetchDataFromServer:(NSString *)url andIndex:(NSInteger)index{
    
//    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleSwingLeft];
//    [MMProgressHUD showWithTitle:@"亲😊数据加载中。。"];
    
    [[NetDataEngine sharedInstance] requestSearchFrom:url success:^(id responsData) {
        
       // [MMProgressHUD dismissWithSuccess:@"👍网络真给力"];
        if (self.index ==0) {
            
            self.dataSourcing= (NSMutableArray *)[RoomlistModel parseResponsDataWithRoolistModel:responsData];
             [self.collectionView reloadData];
            
        }else if (self.index ==1) {
           self.dataSourceNone= (NSMutableArray *)[RoomlistModel parseResponsDataWithRoolistModel:responsData];
             [self.collectionView reloadData];
        }
        //NSLog(@"dataSourcing ---%@",self.dataSourcing);
//        NSLog(@"%ld",self.dataSourcing.count);
        //NSLog(@"dataSourceNone ---%@",self.dataSourceNone);
//         NSLog(@"%ld",self.dataSourceNone.count);
       
        
    } failed:^(NSError *error) {
        [MMProgressHUD dismissWithError:@"😢世界上最远的距离就是没网。。。"];
        
    }];


}

#pragma mark -
#pragma mark UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.index ==0) {
         //NSLog(@"%ld",self.dataSourcing.count);
        return self.dataSourcing.count;
       
       
    }
    if (self.index ==1) {
        return self.dataSourceNone.count;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"categoryCollectionCellId" forIndexPath:indexPath];
   
    
    if (self.index ==0) {
        RoomlistModel *roomListModel =[self.dataSourcing objectAtIndex:indexPath.item];
        [cell updateWithModel:roomListModel];
    }if (self.index ==1) {
       RoomlistModel *roomListModel =[self.dataSourceNone objectAtIndex:indexPath.item];
        [cell updateWithModel:roomListModel];
    }
       return cell;
    


}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PlayerViewController *playVC =[[PlayerViewController alloc]init];
    [self.navigationController pushViewController:playVC animated:YES];
    if (self.index ==0) {
        RoomlistModel *roomListModel =[self.dataSourcing objectAtIndex:indexPath.item];
        playVC.roomId =roomListModel.room_id;
   
    }
    else if (self.index ==1) {
        RoomlistModel *roomListModel =[self.dataSourceNone objectAtIndex:indexPath.item];
        playVC.roomId =roomListModel.room_id;
    
    }
    


}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
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
