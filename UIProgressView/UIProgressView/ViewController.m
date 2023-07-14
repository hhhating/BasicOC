//
//  ViewController.m
//  UIProgressView
//
//  Created by ByteDance on 2023/7/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation ViewController

// 进度条，在播放器类软件中较为常见
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.progressView];
}

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 100, 280, 30)];
        // 已经走过的进度的颜色
        _progressView.progressTintColor = [UIColor redColor];
        // 未走过的进度的颜色
        _progressView.trackTintColor = [UIColor greenColor];
        // 进度条当前的进度，取值为 0~1 之间的浮点数
        _progressView.progress = 0.5;
    }
    return _progressView;
}

@end
