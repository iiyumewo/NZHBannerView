//
//  ViewController.m
//  NZHBannerView
//
//  Created by iiyumewo on 2016/12/7.
//  Copyright © 2016年 iiyumewo. All rights reserved.
//

#import "ViewController.h"
#import "ScrollViewAndPageController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ScrollViewAndPageController *banner = [[ScrollViewAndPageController alloc]initWithImageArray:@[[UIImage imageNamed:@"map"], [UIImage imageNamed:@"studyRoom.jpg"], [UIImage imageNamed:@"deathWing.jpg"]]
                                                                                           frame:CGRectMake(0, 10, CGRectGetWidth(self.view.bounds), 200)];
    [self.view addSubview:banner];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
