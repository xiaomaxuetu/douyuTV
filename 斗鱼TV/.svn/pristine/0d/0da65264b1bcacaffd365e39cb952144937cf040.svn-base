//
//  BaseViewController.m
//  GameLiveStreaming
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "BaseViewController.h"
#import "SearchViewController.h"
#import "ScanViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    //self.automaticallyAdjustsScrollViewInsets =NO;
    
    
    
  [self creatNavgationBar];
}
-(void)creatNavgationBar {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Img_orange@2x"] forBarMetrics:UIBarMetricsDefault];

    if (self.douFishTV ==DouFishTVBackAndTitle) {
        [self creatNavTitle];
        [self creatNavBack];
        
    }else if (self.douFishTV ==DouFishTVTitle) {
        
        [self creatNavTitle];
        
        
        
    }else if(self.douFishTV ==DouFishTVDefult){
        
        [self creatNavTitleView];
        [self creatNavLeftItem];
        [self creatNavRightItem];
        
    }

    

}
#pragma mark -
#pragma mark 定制标题
-(void)creatNavTitleView {
    
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 60*45/104.0)];
    imageView.image =[UIImage imageNamed:@"logo@2x"];
    
    
    
    self.navigationItem.titleView =imageView;
//    self.navigationController.navigationBar.backgroundColor =[UIColor blueColor];
    
    

    
}
-(void)creatNavTitle {
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 34)];
    lable.textAlignment =NSTextAlignmentCenter;
    lable.textColor =[UIColor whiteColor];
    lable.font =[UIFont systemFontOfSize:16];
    //lable.tag =kBaseTitleLable;
    [lable adjustsFontSizeToFitWidth];
    
    [self creatNavTitleText:lable];
    self.navigationItem.titleView =lable;

    

}
-(void)creatNavTitleText:(UILabel *)lable {



}
#pragma mark -
#pragma mark 定制回退按钮及响应事件
-(void)creatNavBack {
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:@"btn_nav_back@2x"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_nav_back_click@2x"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem *backButton =[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem =backButton;
    

}
-(void)backButtonClick:(UIButton *)button {

    [self.navigationController popViewControllerAnimated:YES];


}

#pragma mark -
#pragma mark 定制左侧扫描二维码及响应事件
-(void)creatNavLeftItem {
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:@"Image_scan@2x"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"Image_scan_click@2x"] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftButton =[[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem =leftButton;

}
-(void)leftButtonClick:(UIButton *)button {
    ScanViewController *vc = [[ScanViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}
#pragma mark -
#pragma mark 定制右侧搜索按钮及响应事件
-(void)creatNavRightItem {
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:@"btn_search@2x"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_search_clicked@2x"] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem =rightButton;


}
-(void)rightButtonClick:(UIButton *)button {
//    NSLog(@"rightButtonClick");
    SearchViewController *searchVC =[[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];

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
