//
//  AutoScrollView.m
//  AutoScoll
//
//  Created by lijinghua on 15/8/19.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import "AutoScrollView.h"

#import "PlayerViewController.h"

@interface AutoScrollView ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    NSTimer      *_timer;
    
    UIImageView  *_leftImageView;
    UIImageView  *_centerImageView;
    UIImageView  *_rightImageView;
    
    NSArray      *_imageArray;
    UIPageControl *_pageController;
}
@end

@implementation AutoScrollView

- (id)initWithFrame:(CGRect)frame imageArray:(NSArray*)imageArray
{
    if (self = [super initWithFrame:frame]) {
        
        _imageArray = imageArray;
        
        if (_imageArray.count <= 1) {
            return self;
        }
        
        [self createScrollView];
        [self createContentViews];
        [self createPageControl];
        [self createTapGesture];
        [self startTimer];
    }
    return self;
}

- (void)createScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(3*self.frame.size.width, self.frame.size.height);
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
    [self addSubview:_scrollView];
}

- (void)createContentViews
{
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _leftImageView.tag = _imageArray.count-1;
    
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    _centerImageView.tag = 0;
    
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*2, 0, self.frame.size.width, self.frame.size.height)];
    _rightImageView.tag = 1;
    
    [_scrollView addSubview:_leftImageView];
    [_scrollView addSubview:_centerImageView];
    [_scrollView addSubview:_rightImageView];
    
    _leftImageView.image   = [_imageArray objectAtIndex:_leftImageView.tag];
    _centerImageView.image = [_imageArray objectAtIndex:_centerImageView.tag];
    _rightImageView.image  = [_imageArray objectAtIndex:_rightImageView.tag];
}

/**
 *  在滚动图添加手势
 */
- (void)createTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];

    _centerImageView.userInteractionEnabled = YES;
    
    [_centerImageView addGestureRecognizer:tap];
}
/**
 *  手势响应事件，跳转webView
 */
- (void)handleGesture:(UITapGestureRecognizer *)gesture {
    PlayerViewController *playerVC = [[PlayerViewController alloc] init];
    if (gesture.view.tag > 6) {
        return ;
    }
    playerVC.roomId = self.roomIdArr[gesture.view.tag];
    [self.viewController.navigationController pushViewController:playerVC animated:YES];
}

- (void)createPageControl
{
    _pageController = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    _pageController.center = CGPointMake(self.frame.size.width-50, self.frame.size.height-10);
    _pageController.numberOfPages = _imageArray.count;
    _pageController.pageIndicatorTintColor = [UIColor whiteColor];
    _pageController.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:_pageController];
}

- (void)updateContent
{
    if (_scrollView.contentOffset.x > self.frame.size.width) {
        //next
        _leftImageView.tag   = _centerImageView.tag;
        _centerImageView.tag = _rightImageView.tag;
        _rightImageView.tag  = (_rightImageView.tag + 1)%_imageArray.count;
    }else if(_scrollView.contentOffset.x < self.frame.size.width)
    {
        //before
        _rightImageView.tag  = _centerImageView.tag;
        _centerImageView.tag = _leftImageView.tag;
        if (_leftImageView.tag == 0) {
            _leftImageView.tag = _imageArray.count - 1;
        }else {
            _leftImageView.tag   = (_leftImageView.tag - 1)%_imageArray.count;
        }
    }

    _leftImageView.image   = [_imageArray objectAtIndex:_leftImageView.tag];
    _centerImageView.image = [_imageArray objectAtIndex:_centerImageView.tag];
    _rightImageView.image  = [_imageArray objectAtIndex:_rightImageView.tag];
    
    [_scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
    _pageController.currentPage = _centerImageView.tag;
}

- (void)startTimer
{
    if (_imageArray.count <= 1) return;
    
    [self stopTimer];
    
    //_timer = [[NSTimer alloc]initWithFireDate:nil interval:1 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)nextPage
{
    if (_scrollView.contentOffset.x != 0) {
        [_scrollView setContentOffset:CGPointMake(self.frame.size.width*2, 0) animated:YES];
    }
}

#pragma mark -
#pragma makr UIScollViewDeleage

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateContent];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updateContent];
}

@end
