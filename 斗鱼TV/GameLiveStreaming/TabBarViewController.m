//
//  TabBarViewController.m
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "TabBarViewController.h"
#import "TabBarModel.h"

@interface TabBarViewController ()
@property(nonatomic)NSMutableArray *tabBarModelArray;
@end

@implementation TabBarViewController
- (id)init{
    if (self = [super init]) {
        [self customTabBarModelData];
        [self createContentViewControllers];
    }
    return self;
}
- (void)customTabBarModelData
{
    self.tabBarModelArray = [NSMutableArray array];
    TabBarModel *recommendModel = [TabBarModel modelWithTitle:@"推荐" normalImage:@"btn_home_normal" selectedImage:@"btn_home_selected"];
    TabBarModel *columModel = [TabBarModel modelWithTitle:@"栏目" normalImage:@"btn_column_normal" selectedImage:@"btn_column_selected"];
    TabBarModel *LiveModel = [TabBarModel modelWithTitle:@"直播" normalImage:@"btn_live_normal" selectedImage:@"btn_live_selected"];
    TabBarModel *UserModel = [TabBarModel modelWithTitle:@"我的" normalImage:@"btn_user_normal" selectedImage:@"btn_user_selected"];
    
    [self.tabBarModelArray addObject:recommendModel];
    [self.tabBarModelArray addObject:columModel];
    [self.tabBarModelArray addObject:LiveModel];
    [self.tabBarModelArray addObject:UserModel];
}

- (void)createContentViewControllers
{
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    NSArray *classNameArray = @[@"RecommendViewController",@"ColumnViewController",@"LiveViewController",@"UserViewController"];
    for (int idx = 0; idx < classNameArray.count; idx++) {
        TabBarModel *model = [self.tabBarModelArray objectAtIndex:idx];
        NSString *className = [classNameArray objectAtIndex:idx];
        UIViewController *viewController = [[NSClassFromString(className) alloc]init];
        viewController.title = model.title;
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
        nav.tabBarItem.title = model.title;
        nav.tabBarItem.image = [model normalImage];
        nav.tabBarItem.selectedImage = [model selectedImage];
        
        [viewControllers addObject:nav];
    }
    self.viewControllers    = viewControllers;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
