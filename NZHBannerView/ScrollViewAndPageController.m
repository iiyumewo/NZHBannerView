//
//  ScrollViewAndPageController.m
//  Housing
//
//  Created by xiexufeng on 16/3/25.
//  Copyright © 2016年 xiexufeng. All rights reserved.
//

#import "ScrollViewAndPageController.h"
#import "HousesScrollView.h"


@implementation ScrollViewAndPageController 

- (instancetype)initWithImageArray:(NSArray *)imageArray frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[HousesScrollView alloc]initWithFrame:frame imageArray:imageArray];
        self.backgroundColor = [UIColor clearColor];
        self.scrollView.delegate = self;
        self.maxScrollPageNumber = imageArray.count;
        [self addSubview:_scrollView];
        if ([imageArray count] > 1) {
            //设置pageControl
            self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.frame.size.width/2-50, self.frame.size.height - 30, 100, 30)];
            self.pageControl.numberOfPages = [imageArray count];
            self.pageControl.currentPage = 0;
            self.pageControl.enabled = NO;
            
            [self addSubview:self.pageControl];

        }
        [self configureTimer];
    }
    return self;
}



- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
     CGFloat originPoint = (self.pageControl.frame.size.width-self.maxScrollPageNumber*5.f-(self.maxScrollPageNumber-1)*5.f)/2.f;
    
    [self.pageControl.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        view.backgroundColor = [UIColor clearColor];
        view.frame = [self calculateForCircleForIndex:idx number:self.maxScrollPageNumber];
        
//        NSMutableArray *layoutArray = [NSMutableArray array];
        
//        [layoutArray addObject:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(originPoint+idx*18)-[view]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
        
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.pageControl).with.offset(originPoint+idx*18);
//            make.top.equalTo(self.pageControl).with.offset(self.pageControl.frame.size.height/2-5);
//            make.height.width.mas_equalTo(6);
//        }];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        [view addSubview:imageView];
        if (idx == 0) {
            imageView.image = [UIImage imageNamed:@"SelectBannarCircle"];
        }else {
            imageView.image = [UIImage imageNamed:@"UnselectBannarCircle"];
        }
    }];
}
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    [_pageControl.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
//        view.backgroundColor = [UIColor clearColor];
//        view.frame = [self calculateForCircleForIndex:idx number:self.maxScrollPageNumber];
//    }];
//}

- (CGRect)calculateForCircleForIndex:(NSInteger)index number:(NSInteger)circleNumber {
    CGFloat originPoint = (self.pageControl.frame.size.width-circleNumber*5.f-(circleNumber-1)*5.f)/2.f;
    CGRect rect = CGRectMake(originPoint+index*18, self.pageControl.frame.size.height/2-5, 6, 6);
    return rect;
}

- (void)configureTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}
- (void)timerAction:(NSTimer *)timer {
    CGPoint newOffset = CGPointMake(self.scrollView.contentOffset.x + self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:newOffset animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f, %f, %f, %f", self.pageControl.frame.origin.x, self.pageControl.frame.origin.y, self.pageControl.frame.size.width, self.pageControl.frame.size.height);
    if (scrollView == self.scrollView) {
//        for (UIView *view in self.pageControl.subviews) {
//            NSLog(@"%f %f, %f, %f, %f",scrollView.contentOffset.x ,view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
//        }
        if (scrollView.contentOffset.x >= scrollView.frame.size.width*(self.maxScrollPageNumber+1)) {
            [scrollView setContentOffset:CGPointMake(kWidth, 0) animated:NO];
        }else if (scrollView.contentOffset.x <= 0) {
            [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width * self.maxScrollPageNumber, 0) animated:NO];
        }
        CGFloat indexIndicator = (scrollView.contentOffset.x/(self.frame.size.width/2)-1)/2;
        if (indexIndicator <= 0) {
            self.pageControl.currentPage = self.maxScrollPageNumber-1;
        }else if (indexIndicator > self.maxScrollPageNumber) {
            self.pageControl.currentPage = 0;
        }else {
            NSInteger index = indexIndicator;
            self.pageControl.currentPage = index;
        }
        [self.pageControl.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
            view.backgroundColor = [UIColor clearColor];
            if (idx != self.pageControl.currentPage) {
                view.frame = [self calculateForCircleForIndex:idx number:self.maxScrollPageNumber];
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
                [view.subviews.firstObject removeFromSuperview];
                [view addSubview:imageView];
                imageView.image = [UIImage imageNamed:@"UnselectBannarCircle"];
            }else {
                view.frame = [self calculateForCircleForIndex:idx number:self.maxScrollPageNumber];
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
                [view.subviews.firstObject removeFromSuperview];
                [view addSubview:imageView];
                imageView.image = [UIImage imageNamed:@"SelectBannarCircle"];
            }
//            NSLog(@"%f, %f, %f, %f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        }];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        [self configureTimer];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        [self.timer invalidate];
        self.timer = nil;
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
