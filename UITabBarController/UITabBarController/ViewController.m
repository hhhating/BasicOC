//
//  ViewController.m
//  UITabBarController
//
//  Created by ByteDance on 2023/7/17.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 标签控制器也是视图控制器，是一个容器类，容器内的视图控制器是并列的关系
// 一个视图控制器一旦被加入标签控制器容器中，只要标签控制器存在，视图控制器就不会被释放
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    // 容器颜色
    tabBar.tabBar.barTintColor = [UIColor greenColor];
    // 标签颜色
    tabBar.tabBar.tintColor = [UIColor purpleColor];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    // 当标签控制器中对于5个视图控制器时，UITabBarController 会自动创建一个包含表格驶入的导航控制器，在表格视图中将多出的视图控制器排列出来
    // 其中第五个标签被系统征用为 more 标签
    for (int i = 0; i < 5; i++) {
        UIViewController *con = [[UIViewController alloc] init];
        con.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
        con.tabBarItem.title = [NSString stringWithFormat:@"%d 视图", i];
        con.tabBarItem.image = [UIImage imageNamed:@"file"];
        
        con.tabBarItem.selectedImage = [UIImage imageNamed:@"file_selected"];
        [array addObject:con];
    }
    tabBar.viewControllers = array;
    [self presentViewController:tabBar animated:YES completion:nil];
}

@end
