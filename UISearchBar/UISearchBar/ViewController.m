//
//  ViewController.m
//  UISearchBar
//
//  Created by ByteDance on 2023/7/17.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.searchBar];
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 100, 280, 30)];
        // 设置光标和扩展栏的颜色
        _searchBar.tintColor = [UIColor redColor];
        _searchBar.placeholder = @"请输入搜索内容";
        // 是否显示扩展栏，扩展栏实际上是 UISegmentedControl 控件
        _searchBar.showsScopeBar = YES;
        // 是否显示取消按钮
        _searchBar.showsCancelButton = YES;
        // 是否显示图书按钮
        _searchBar.showsBookmarkButton = YES;
        // 用于设置扩展栏上所有按钮的标题，传入的数组中的元素的个数对应扩展栏上按钮的个数
        [_searchBar setScopeButtonTitles:@[@"one", @"two", @"three"]];
    }
    return _searchBar;
}

// UISearchBar 中单击按钮的触发逻辑和用户输入要搜索的字符时的相关监听都是通过 UISearchBarDelegate 协议中的方法回调的

@end
