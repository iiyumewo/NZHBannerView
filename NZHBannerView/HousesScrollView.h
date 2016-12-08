//
//  HousesScrollView.h
//  Housing
//
//  Created by xiexufeng on 16/3/25.
//  Copyright © 2016年 xiexufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kWidth [UIScreen mainScreen].bounds.size.width

@interface HousesScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;

@end
