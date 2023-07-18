//
//  ViewController.m
//  UIScrollView
//
//  Created by ByteDance on 2023/7/18.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController
// 滚动视图用来展示某些内容超出一瓶额视图
- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 50, 240, 240)];
    imageView.image = [UIImage imageNamed:@"image"];
    [scrollView addSubview:imageView];
    // 设置滚动视图的内容大小，内容区域决定可滚动的范围
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, self.view.frame.size.height * 2);
    [self.view addSubview:scrollView];
}


@end
