//
//  ViewController.m
//  UINavigationController
//
//  Created by ByteDance on 2023/7/17.
//

#import "ViewController.h"
static int conIndex = 1;
@interface ViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

// 导航控制器是视图控制器的管理者，是专门来管理 ViewController 的一个容器类
// 导航控制器是 iOS 常用的多视图控制器之一，引起采用栈的设计模式 .先进后出，后进先出
// 在新 push 出来的视图控制器中，导航栏的左侧会出现一个 back 返回按钮，单击返回按钮会执行导航控制器的 pop 操作
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.btn];
    self.title = [NSString stringWithFormat:@"第%d视图控制器", conIndex];
    conIndex++;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        _btn.frame = CGRectMake(20, 100, 280, 30);
        [_btn setTitle:@"push" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)push {
    ViewController *con = [[ViewController alloc] init];
    con.title = [NSString stringWithFormat:@"第%d视图控制器", conIndex];
    // navigationController 获得它的导航控制器，参1：要 push 的视图控制器 参2：是否带动画效果
    [self.navigationController pushViewController:con animated:YES];
}

- (void)dealloc {
    conIndex--;
}

@end
