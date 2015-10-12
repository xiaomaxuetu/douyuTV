//
//  ScanViewController.m
//  GameLiveStreaming
//
//  Created by Qianfeng on 15/10/7.
//  Copyright (c) 2015年 mayongxin. All rights reserved.
//

#import "ScanViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerViewController.h"
@interface ScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property(nonatomic)AVCaptureDevice *device;
@property(nonatomic)AVCaptureDeviceInput *input;
@property(nonatomic)AVCaptureMetadataOutput *output;
@property(nonatomic)AVCaptureSession *session;
@property(nonatomic)AVCaptureVideoPreviewLayer *previewLayer;



@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    self.input = [[AVCaptureDeviceInput alloc]initWithDevice:self.device error:nil];
    self.output = [[AVCaptureMetadataOutput alloc]init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    self.session = [[AVCaptureSession alloc]init];
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    if ([self.session canAddOutput:self.output]) {
        [self.session addOutput:self.output];
    }
    [self.output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    //使用self.session，初始化预览层，self.session负责驱动input进行信息的采集，layer负责把图像渲染显示
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    self.previewLayer.frame = CGRectMake(0, (kScreenHeight-kScreenWidth-64-49)/2.0, kScreenWidth, kScreenWidth);
    
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.previewLayer];
    
    //开始启动
    [self.session startRunning];

    
}
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    //停止扫描
    [self.session stopRunning];
    
    if ([metadataObjects count] >= 1) {
        //数组中包含的都是AVMetadataMachineReadableCodeObject 类型的对象，该对象中包含解码后的数据
        AVMetadataMachineReadableCodeObject *qrObject = [metadataObjects lastObject];
        NSLog(@"识别成功%@",qrObject.stringValue);
        NSString *roomIdString = [qrObject.stringValue substringFromIndex:23];
        NSLog(@"%@",roomIdString);
        PlayerViewController *vc = [[PlayerViewController alloc]init];
        vc.roomId = roomIdString;
        [self.navigationController pushViewController:vc animated:YES];
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
