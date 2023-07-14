//
//  ViewController.m
//  UIActivityIndicatorView
//
//  Created by ByteDance on 2023/7/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@end

@implementation ViewController
// 在某些加载复杂数据的视图下载数据的场景中会用到
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.indicator];
    // 指示器开始转动，还有个 stopAnimating 来使指示器停止转动
    [self.indicator startAnimating];
}

- (UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        _indicator.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        _indicator.color = [UIColor purpleColor];
    }
    return _indicator;
}

@end
