//
//  ViewController.m
//  CALayer
//
//  Created by ByteDance on 2023/7/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

// 任何一个 UIVIew 的子类中都包含一个 CALayer 的属性，并且 UIVIew 层的 UI 展示也是通过 Layer 渲染的
// UIKit 中大多数控件创建时的尺寸都是规则矩形，实际开发可能会使用圆角的控件，以 UIButton 为例
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button];
    
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(100, 100, 100, 100);
        _button.backgroundColor = [UIColor redColor];
        
        // 只有设置为 YES，对视图边界进行修饰的效果才会显现
        // _button.layer.masksToBounds = YES;
        // 设置圆角的半径
        // _button.layer.cornerRadius = 10;
        
        /// 如果给视图添加了圆角，就会导致阴影效果无法正常显示出来
        
        // 为控件添加阴影
        // 阴影的颜色需要设置为 CGColor 对象
        _button.layer.shadowColor = [UIColor grayColor].CGColor;
        // 阴影的位置与原控件位置间的相对偏移
        _button.layer.shadowOffset = CGSizeMake(10, 10);
        // 阴影的透明度，如果不设置就是全透明，没有任何的效果
        _button.layer.shadowOpacity = 1;
    }
    return _button;
}

@end
