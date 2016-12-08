//
//  HousesScrollView.m
//  Housing
//
//  Created by xiexufeng on 16/3/25.
//  Copyright © 2016年 xiexufeng. All rights reserved.
//

#import "HousesScrollView.h"

@interface HousesScrollView ()

@property (nonatomic, strong)NSArray *adListArr;

@end


@implementation HousesScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.panGestureRecognizer.maximumNumberOfTouches = 1;
        NSMutableArray *insertArray = [NSMutableArray arrayWithArray:imageArray];
        [insertArray insertObject:imageArray.lastObject atIndex:0];
        [insertArray addObject:imageArray.firstObject];
        
        self.adListArr = [NSArray arrayWithArray:insertArray];
        
        if ([imageArray count] > 1) {
            self.contentOffset = CGPointMake(kWidth, 0);
        } else {
            self.contentOffset = CGPointMake(0, 0);
        }
        self.contentSize = CGSizeMake([insertArray count]*kWidth, 0);
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        
        for (int i = 0; i < [insertArray count]; i ++) {
            
//            AdListDataModel *model = [insertArray objectAtIndex:i];
            
            UIImageView *picture = [[UIImageView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth, frame.size.height)];
            picture.tag = i;
            picture.userInteractionEnabled = YES;
            picture.clipsToBounds = YES;
            picture.contentMode = UIViewContentModeScaleAspectFill;
            
//            [picture sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"img-1"]];
            picture.image = insertArray[i];
            
            [self addSubview:picture];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
            [picture addGestureRecognizer:tap];
//            [tap addTarget:self action:@selector(tapToActivityDetail:)];
            
            
        }
    }
    return self;
}

//- (void)tapToActivityDetail:(UITapGestureRecognizer *)tap {
//    
//    AdListDataModel *model = [self.adListArr objectAtIndex:tap.view.tag];
//    
//    AdvertisemDetailViewController *adDetailVC = [HOMEPAGE_STORYBOARD instantiateViewControllerWithIdentifier:@"AdvertisemDetailViewController"];
//    
//    if (model.related && model.related.length != 0) {
//        adDetailVC.url = model.related;
//    } else {
//        adDetailVC.url = model.url;
//    }
//
//    adDetailVC.titleName = model.title;
//    
//    adDetailVC.navigationItem.title = @"活动";
//    
////    MainTabBarViewController *tabBarControler =(MainTabBarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    [[BaseTool getCurrentNavigationController] pushViewController:adDetailVC animated:YES];
//    
//}

@end
