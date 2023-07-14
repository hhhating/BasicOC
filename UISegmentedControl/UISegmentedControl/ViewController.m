//
//  ViewController.m
//  UISegmentedControl
//
//  Created by ByteDance on 2023/7/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISegmentedControl *seg;
@end

@implementation ViewController
// UISegmentedControl 分段控制器，常用于导航懒得标题视图中
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.seg];
}

- (UISegmentedControl *)seg {
    if (!_seg) {
        _seg = [[UISegmentedControl alloc] initWithItems:@[@"one", @"", @"three", @"fouruuuuuuu"]];
        _seg.frame = CGRectMake(20, 100, 280, 30);
        // 用于设置索引为1的按钮图片
        [_seg setImage:[[UIImage imageNamed:@"photo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forSegmentAtIndex:1];
        // 用于设置索引为0的按钮内容的偏移量
        [_seg setContentOffset:CGSizeMake(10, 10) forSegmentAtIndex:0];
        
        /// 对按钮进行增、删、改操作
        /// 在索引2的位置添加按钮
        /// [_seg insertSegmentWithTitle:@"new" atIndex:2 animated:YES];
        /// 移除索引1处的按钮
        /// [_seg removeSegmentAtIndex:1 animated:YES];
        /// 修改索引1处的按钮标题
        /// [_seg setTitle:@"replace" forSegmentAtIndex:1];
        /// 移除所有按钮
        /// [_seg removeAllSegments];
        
        // 自定义设置控件中按钮的宽度
        // [_seg setWidth:130 forSegmentAtIndex:3];
        
        // 设置控件中按钮宽度的自适应
        _seg.apportionsSegmentWidthsByContent = YES;
        
        // 用于设置按钮的切换模式，NO为切换按钮模式， YES为触发按钮模式
        // 切换按钮模式：用户点击一个按钮后，此按钮会一直保持选中状态，直到用户切换为另一个为止
        // 触发按钮模式：用户手指离开屏幕后，按钮将不保持选中状态
        _seg.momentary = NO;
    }
    return _seg;
}

@end
