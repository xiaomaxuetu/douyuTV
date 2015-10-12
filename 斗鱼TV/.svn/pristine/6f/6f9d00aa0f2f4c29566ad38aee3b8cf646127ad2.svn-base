//
//  PlayerViewController.m
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/5.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "PlayerViewController.h"
#import "KrVideoPlayerController.h"

#import <AVFoundation/AVFoundation.h>
#define RoomUrl @"http://www.douyutv.com/api/v1/room/%@?aid=ios&auth=040e01d1cfb758be5246a9b5d5c0a672&client_sys=ios&time=1443835800"
@interface PlayerViewController ()


@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *showDetailLabel;
@property (nonatomic, strong) KrVideoPlayerController  *videoController;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;




@property (nonatomic)AVPlayer *player;
@property (nonatomic)NSString *playUrl;
@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self fetchData];
    //[self toolbarHidden:YES];
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)playVideo{
    NSURL *url = [NSURL URLWithString:self.playUrl];
    NSLog(@"%@",self.playUrl);
    if (self.playUrl) {
        [self addVideoPlayerWithURL:url];
    }
    
}

- (void)addVideoPlayerWithURL:(NSURL *)url{
    if (!self.videoController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.videoController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, 64, width, width*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController setWillBackOrientationPortrait:^{
            [weakSelf toolbarHidden:NO];
        }];
        [self.videoController setWillChangeToFullscreenMode:^{
            [weakSelf toolbarHidden:YES];
        }];
        [self.view addSubview:self.videoController.view];
    }
    self.videoController.contentURL = url;
    
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}

//隐藏navigation tabbar 电池栏
- (void)toolbarHidden:(BOOL)Bool{
    self.navigationController.navigationBar.hidden = Bool;
    self.tabBarController.tabBar.hidden = Bool;
    [[UIApplication sharedApplication] setStatusBarHidden:Bool withAnimation:UIStatusBarAnimationFade];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [self.videoController stop];
}
-(void)fetchData{
    [[NetDataEngine sharedInstance] requestColumnFrom:[NSString stringWithFormat:RoomUrl,self.roomId] success:^(id responsData) {

        self.playUrl = [[responsData objectForKey:@"data"] objectForKey:@"hls_url"];
        //NSLog(@"%@",self.playUrl);
        NSURL *url = [NSURL URLWithString:self.playUrl];
        [self addVideoPlayerWithURL:url];
        NSString *headImageUrl = [[responsData objectForKey:@"data"] objectForKey:@"owner_avatar"];
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:headImageUrl] placeholderImage:[UIImage imageNamed:@"Image_head@2x"]];
        
        NSString *nickName = [[responsData objectForKey:@"data"] objectForKey:@"nickname"];
        self.nickNameLabel.text= [NSString stringWithFormat:@"主播昵称:%@",nickName];
        
        //NSString *roomName =[[responsData objectForKey:@"data"] objectForKey:@"room_name"];
        NSString *weight = [[responsData objectForKey:@"data"] objectForKey:@"owner_weight"];
        self.fatLabel.text = [NSString stringWithFormat:@"主播体重:%@",weight];
        
        NSString *fans = [[responsData objectForKey:@"data"] objectForKey:@"fans"];
        self.fansCountLabel.text = [NSString stringWithFormat:@"粉丝数:%@",fans];
        
        NSString *detail = [[responsData objectForKey:@"data"] objectForKey:@"show_details"];
        self.showDetailLabel.text = detail;
        
        
    } failed:^(NSError *error) {
        
    }];
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
