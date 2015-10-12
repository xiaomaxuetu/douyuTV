//
//  SearchViewController.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"
#import "NetDataEngine.h"
#import "GLSDBManager.h"
#import "RoomlistModel.h"
@interface SearchViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>
@property(nonatomic)UISearchBar *searchBar;
@property(nonatomic)UISearchDisplayController *displayController;
@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataSource;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customUI];
    [self customTableView];
    [self loadDataSource];
    
    // Do any additional setup after loading the view.
}
#pragma mark -
#pragma mark 数据或者View的基本定制
-(void)loadDataSource {

//    NSArray *dataArray =(NSMutableArray *)[[GLSDBManager sharedInstance]readAppInfoList:nil];
//    for (int index =0; index <dataArray.count; index ++) {
//        NSString *str =[self changeDataToEncoding:[dataArray objectAtIndex:index]];
//        [self.dataSource addObject:str];
//    }
    self.dataSource =(NSMutableArray *)[[GLSDBManager sharedInstance]readAppInfoList:nil];
    
    
    
    [self.tableView reloadData];
    


}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.douFishTV =DouFishTVBackAndTitle;
        self.dataSource =[NSMutableArray array];
    }
    return self;
}
-(void)customTableView {
    
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight-44) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    
    [self.view addSubview:self.tableView];
    

}
-(void)creatNavTitle {
    
    self.searchBar =[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth -40, 30)];
    self.searchBar.placeholder =@"请输入搜索的内容";
    self.searchBar.showsSearchResultsButton =YES;
   
    
    self.searchBar.tintColor =[UIColor whiteColor];
    self.navigationItem.titleView =self.searchBar;
    [self.navigationController.navigationBar addSubview:self.searchBar];
    self.searchBar.delegate =self;
    [self.searchBar becomeFirstResponder];
    
    self.displayController =[[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    
    
}
-(void)customUI {
    
    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    lable.backgroundColor =[UIColor lightGrayColor];
    
    lable.font =[UIFont systemFontOfSize:15];
   lable.text =@"历史搜索 ";
    lable.textAlignment =NSTextAlignmentLeft;
    lable.textColor =[UIColor grayColor];
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds =CGRectMake(0, 0, 120, 30);
    button.center =CGPointMake(kScreenWidth -60, 22);
    [button setTitle:@"清空历史记录" forState:UIControlStateNormal];
    //button.backgroundColor =[UIColor redColor];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClickDataFromScreen:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font =[UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
   // NSLog(@"%@",lable.subviews);
    [self.view addSubview:lable];
    [self.view bringSubviewToFront:button];
    
}
-(void)buttonClickDataFromScreen:(UIButton *)button {
    
    for (int index =0; index <self.dataSource.count; index ++) {
        NSString *str =[self.dataSource objectAtIndex:index];
       
        [[GLSDBManager sharedInstance]deleteAppInfo:str type:nil];
       
    }
    [self.dataSource removeAllObjects];
     [self.tableView reloadData];

    
    
    


}
#pragma mark -
#pragma mark 历史记录的数据处理的相关结果
-(NSString *)changeDataToEncoding:(NSString *)name {
    
    return [name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];


}
-(void)judgementDataToEquel:(SearchDetailViewController *)searchDetailVC andNSString:(NSString *)string {
    
    NSString *name =string;
    
    NSInteger tag =0;
    for (int index =0; index <self.dataSource.count; index ++) {
        
      NSString *dataStr =  [self.dataSource objectAtIndex:index];
        if ([name isEqualToString:dataStr]) {
            tag =1;
            break;
            
        }
    }
    
    if (tag ==0) {
        NSString *str = name;
        [[GLSDBManager sharedInstance] addAppInfo:str type:nil];
        
        [self.dataSource addObject:str];
    }
    
    
    [self.tableView reloadData];
    //NSLog(@"%@",searchNextVC.keyword);
    [self.navigationController pushViewController:searchDetailVC animated:YES];

    
    

}
#pragma mark -
#pragma mark UISearchBarDelegate
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%@",text);
    if ([text isEqualToString:@" "]) {
        return NO;
    }
    return YES;
    
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    //[searchBar resignFirstResponder];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    return YES;
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)    searchText {
    if (searchBar.text.length ==0) {
        return;
    }
    
    
    
    
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //
    SearchDetailViewController *searchDetailVC =[[SearchDetailViewController alloc]init];
    searchDetailVC.keyword =searchBar.text;
    [self judgementDataToEquel:searchDetailVC andNSString:searchBar.text];
    
    
    
    //    SportsDetailViewController *sports =[[SportsDetailViewController alloc]init];
    //    sports.id =searchBar.text;
    //    [self.navigationController pushViewController:sports animated:YES];
    
    
    
    
    
}
#pragma mark -
#pragma mark UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     NSLog(@"self.dataSource.count = %ld",self.dataSource.count);
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    NSString *name =[self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text =name;
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.searchBar.text =nil;
    if ([self.searchBar.text isEqualToString:@""]) {
        
//        NSLog(@"%@",self.searchBar.text);
        SearchDetailViewController *searchDetailVC =[[SearchDetailViewController alloc]init];
        searchDetailVC.keyword =[self.dataSource objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:searchDetailVC animated:YES];
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
