# NZHBannerView

NZHBannerView allows you to quickly create a formated banner view.

## Installation
### Manually
1. Download all the files in the NZHBannerView.
2. Add the source files to your Xcode project.
3. Include wherever you need it with #import "ScrollViewAndPageController.h".

## Usage
NZHBannerView is very simple, we just need to give two necessary conditions, the array with Ad images, and the frame of the banner view.
So the easiest way to init and show a NZHBannerView instance just like this:
```Objective-C
    ScrollViewAndPageController *banner = [[ScrollViewAndPageController alloc]initWithImageArray:@[[UIImage imageNamed:@"map"], [UIImage imageNamed:@"studyRoom.jpg"], [UIImage imageNamed:@"deathWing.jpg"]]
                                                                                           frame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200)];
    [self.view addSubview:banner];
```
