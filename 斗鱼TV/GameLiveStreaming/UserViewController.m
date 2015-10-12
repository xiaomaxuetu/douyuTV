//
//  UserViewController.m
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/4.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "UserViewController.h"
#import "MyControl.h"
#import "OurViewController.h"

@interface UserViewController ()<UIActionSheetDelegate>

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [MyControl creatButtonWithFrame:CGRectMake(0, 20, kScreenWidth, 30) target:self sel:@selector(btn1Click:) tag:100 image:nil title:@"关于我们"];
    button.backgroundColor = [UIColor colorWithRed:255.0/255 green:97.0/255 blue:0.0/255 alpha:1.0];
    [self.view addSubview:button];
    
    UIButton *button2 = [MyControl creatButtonWithFrame:CGRectMake(0, 55, kScreenWidth, 30) target:self sel:@selector(btn2Click:) tag:100 image:nil title:@"清除缓存"];
    button2.backgroundColor = [UIColor colorWithRed:255.0/255 green:97.0/255 blue:0.0/255 alpha:1.0];

    [self.view addSubview:button2];

}
-(void)btn1Click:(UIButton *)button{
    OurViewController *vc = [[OurViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)btn2Click:(UIButton *)button{
    NSString *title = [NSString stringWithFormat:@"删除缓存文件:%.2fM",[self getCachesSize]];
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:nil];
    [sheet showInView:self.view];
    
}
-(double)getCachesSize{
    double siSize=[[SDImageCache sharedImageCache]getSize];
    NSString* filepath=[NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/MyCaches"];
    NSDirectoryEnumerator* enumerator=[[NSFileManager defaultManager]enumeratorAtPath:filepath];
    double mySize=0;
    for (NSString* fileName in enumerator) {
        NSString* Filepath=[filepath stringByAppendingString:fileName];
        NSDictionary* dict=[[NSFileManager defaultManager] attributesOfItemAtPath:Filepath error:nil];
        mySize+=dict.fileSize;
    }
    double totalSize=(mySize+siSize)/1024/1024;
    return totalSize;
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==actionSheet.destructiveButtonIndex) {
        [[SDImageCache sharedImageCache]clearMemory];
        [[SDImageCache sharedImageCache]clearDisk];
        NSString* myCachePath=[NSHomeDirectory() stringByAppendingString:@"/Library/Caches/MyCaches"];
        [[NSFileManager defaultManager]removeItemAtPath:myCachePath error:nil];
        
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
