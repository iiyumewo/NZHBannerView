//
//  ScrollViewAndPageController.h
//  Housing
//
//  Created by xiexufeng on 16/3/25.
//  Copyright © 2016年 xiexufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HousesScrollView;

@interface ScrollViewAndPageController : UIView <UIScrollViewDelegate>

@property (nonatomic,strong) HousesScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger maxScrollPageNumber;

- (instancetype)initWithImageArray:(NSArray *)imageArray frame:(CGRect)frame;

@end
