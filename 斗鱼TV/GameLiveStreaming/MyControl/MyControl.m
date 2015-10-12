//
//  MyControl.m

//
//  Created by LZXuan on 14-5-9.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "MyControl.h"

@implementation MyControl
+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:15];
    return label ;
}

+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)name title:(NSString *)title{
    UIButton *button = nil;
    if (name) {
        //创建图片按钮
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        if (title) {//图片标题按钮
            [button setTitle:title forState:UIControlStateNormal];
        }
        
    }else if (title) {
        //创建标题按钮
        button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)name{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image  = [UIImage imageNamed:name];
    return imageView ;
}
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)string delegate:(id<UITextFieldDelegate>)delegate tag:(NSInteger)tag{
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    //设置风格类型
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = string;
    //设置代理
    textField.delegate = delegate;
    //设置tag值
    textField.tag = tag;
    return textField ;
    
}


@end





