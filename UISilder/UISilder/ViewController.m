//
//  ViewController.m
//  UISilder
//
//  Created by ByteDance on 2023/7/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.slider];
}

- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 100, 280, 30)];
        // 设置控件的触发方法是否连续
        // 如果为真，用户在滑动滑块时，触发方法会多次执行
        // 如果为假，只有在用户滑动操作结束时，方法才会触发
        _slider.continuous = YES;
        _slider.minimumValue = 0;
        _slider.maximumValue = 10;
        // 滑块在左中轴的颜色
        _slider.minimumTrackTintColor = [UIColor redColor];
        // 滑块在右中轴的颜色
        _slider.maximumTrackTintColor = [UIColor greenColor];
        // 滑块本身的颜色
        _slider.thumbTintColor = [UIColor blueColor];
        // 左视图图片
        _slider.minimumValueImage = [UIImage imageNamed:@"photo"];
        // 右视图图片
        _slider.maximumValueImage = [UIImage imageNamed:@"photo"];
        // 控件在某个状态下的图片
        [_slider setThumbImage:[UIImage imageNamed:@"photo"] forState:UIControlStateNormal];
        [_slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

- (void)changeValue:(UISlider *)slider {
    NSLog(@"%f", slider.value);
}

@end
