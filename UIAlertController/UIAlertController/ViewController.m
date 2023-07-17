//
//  ViewController.m
//  UIAlertController
//
//  Created by ByteDance on 2023/7/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 警告框  实现一个当用户单击屏幕时会触发的方法来演示警告框
- (void)viewDidLoad {
    [super viewDidLoad];
}

// 用户单击屏幕的时候被系统自动调用
// 警告框代码如下
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    // 创建 UIAlertController 对象，参1：标题  参2：警告视图的内容 参3：警告视图的风格
//    // 风格选用的是警告框风格
//    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"标题" message:@"警告的内容" preferredStyle:UIAlertControllerStyleAlert];
//    // UIAlertAction 封装了触发方法的选项按钮，参1：按钮的标题 参2：按钮的风格
//    // 风格选用的是默认等个
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"按钮" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
//        NSLog(@"click");
//    }];
//    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
//        NSLog(@"取消");
//    }];
//    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"注意" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
//        NSLog(@"注意");
//    }];
//    // 当选项按钮不超过两个时，按钮会横向并列排列，超过两个则会纵向排列
//    [alertView addAction:action];
//    [alertView addAction:action2];
//    [alertView addAction:action3];
//    // 向警告框中添加一个输入框，开发者可以在代码块中对输入框进行一些设置
//    // 只有当警告控制器的风格为 UIAlertControllerStyleAlert 时才可以使用下面的方法添加输入框，否则会出现错误
//    [alertView addTextFieldWithConfigurationHandler:^(UITextField *_Nonnull textField) {
//        textField.placeholder = @"place";
//    }];
//    // 因为 UIAlertController 是一种视图控制器，所以要使用下面的方法进行跳转
//    [self presentViewController:alertView animated:YES completion:nil];
//}

// 活动列表代码如下
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"one" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"one");
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"two" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"two");
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"three" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"three");
    }];
    [actionSheet addAction:action];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    [self presentViewController:actionSheet animated:YES completion:nil];
}

@end
