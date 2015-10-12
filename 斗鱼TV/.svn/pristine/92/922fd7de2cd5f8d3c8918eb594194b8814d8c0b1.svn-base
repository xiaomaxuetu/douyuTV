//
//  MyControl.h
//  MusicPlayer_V1.0
//
//  Created by LZXuan on 14-5-9.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
 这个类就可以为我们专门来创建一些基本的控件，那么如果要创建Label button textField 就可以通过这个类来创建
 这个类好像一个工厂一样专门生产一些基本控件
 类似于工厂设计模式
 */

@interface MyControl : NSObject
//这个类的功能就是创建label 和button
+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                            text:(NSString *)text ;
//创建button可以创建 标题按钮和 图片按钮
+ (UIButton *)creatButtonWithFrame:(CGRect)frame
                            target:(id)target
                               sel:(SEL)sel
                               tag:(NSInteger)tag
                             image:(NSString *)name
                             title:(NSString *)title;
//创建UIImageView
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame
                               imageName:(NSString *)name;
//创建UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                             placeHolder:(NSString *)string
                                delegate:(id <UITextFieldDelegate>)delegate
                                     tag:(NSInteger)tag;
@end
