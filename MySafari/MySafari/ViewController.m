//
//  ViewController.m
//  Browser
//
//  Created by ByteDance on 2023/7/19.
//

#import "ViewController.h"
#import "HistoryTableViewController.h"
#import "LikeTableViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKNavigationDelegate, UIGestureRecognizerDelegate>
// 网页视图
@property (nonatomic, strong) WKWebView *webView;
// 地址栏
@property (nonatomic, strong) UITextField *searchBar;
// 标记导航栏和工具栏是否处于隐藏状态
@property (nonatomic, assign) BOOL isUp;
// 显示当前网页的地址
@property (nonatomic, strong) UILabel *titleLabel;
// 上滑手势
@property (nonatomic, strong) UISwipeGestureRecognizer *upSwipe;
// 下滑手势
@property (nonatomic, strong) UISwipeGestureRecognizer *downSwipe;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isUp = NO;
    // 默认加载百度
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.baidu.com"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    // 添加手势
    [self.webView addGestureRecognizer:self.upSwipe];
    [self.webView addGestureRecognizer:self.downSwipe];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.titleLabel];
    self.navigationController.toolbarHidden = NO;
    [self createToolBar];
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
        _webView.scrollView.bounces = NO;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, self.view.frame.size.width-40, 20)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UITextField *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, self.view.frame.size.width - 40, 30)];
        _searchBar.borderStyle = UITextBorderStyleRoundedRect;
        UIButton *goBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [goBtn addTarget:self action:@selector(goWeb) forControlEvents:UIControlEventTouchUpInside];
        goBtn.frame = CGRectMake(0, 0, 30, 30);
        [goBtn setTitle:@"GO" forState:UIControlStateNormal];
        _searchBar.rightView = goBtn;
        _searchBar.rightViewMode = UITextFieldViewModeAlways;
        _searchBar.placeholder = @"请输入网址";
        self.navigationItem.titleView = _searchBar;
    }
    return _searchBar;
}

- (void)goWeb {
    if (self.searchBar.text.length > 0) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@", self.searchBar.text]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        self.navigationController.toolbarHidden = NO;
        [self.navigationController setToolbarHidden:NO animated:YES];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"输入的网址不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
}

- (UISwipeGestureRecognizer *)upSwipe {
    if (!_upSwipe) {
        _upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upSwipeMethod)];
        _upSwipe.delegate = self;
        // 设置滑动的方向
        _upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    }
    return _upSwipe;
}

- (UISwipeGestureRecognizer *)downSwipe {
    if (!_downSwipe) {
        _downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downSwipeMethod)];
        _downSwipe.delegate = self;
        _downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    }
    return _downSwipe;
}

- (void)upSwipeMethod {
    // 首先判断导航栏和工具栏是否处于隐藏状态，如果不是，再执行相应的操作
    if (self.isUp) {
        return;
    }
    self.navigationItem.titleView = nil;
    self.webView.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40);
    // UIView 层用于处理渐变动画的方法
    // 参 1：动画执行的时间 参 2：将要执行动画的属性的代码块放在这里 参 3：执行动画后的回调
    [UIView animateWithDuration:0.3 animations:^{
        self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 40);
        [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:7 forBarMetrics:UIBarMetricsDefault];
    } completion:^(BOOL finished) {
        self.navigationItem.titleView = self.titleLabel;
    }];
    [self.navigationController setToolbarHidden:YES animated:YES];
    self.isUp = YES;
}

// 将隐藏状态的导航栏和工具栏还原为正常的状态
- (void)downSwipeMethod {
    if (self.webView.scrollView.contentOffset.y == 0 && self.isUp) {
        self.navigationItem.titleView = nil;
        self.webView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
        [UIView animateWithDuration:0.3 animations:^{
            self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 64);
            [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        } completion:^(BOOL finished) {
            self.navigationItem.titleView = self.searchBar;
        }];
        [self.navigationController setToolbarHidden:NO animated:YES];
        self.isUp = NO;
    }
}

- (void)createToolBar {
    // 创建了四个功能按钮，历史记录按钮、收藏按钮、前进按钮、后退按钮
    // emptyItem、emptyItem2、emptyItem3 按钮没有实际用途，只是为了布局进行占位
    if (self.navigationController) {
        UIBarButtonItem *itemHistory = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goHistory)];
        UIBarButtonItem *itemLike = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(goLike)];
        UIBarButtonItem *itemBack = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
        UIBarButtonItem *itemForward = [[UIBarButtonItem alloc] initWithTitle:@"forward" style:UIBarButtonItemStylePlain target:self action:@selector(goForward)];
        UIBarButtonItem *emptyItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        self.toolbarItems = @[emptyItem, itemHistory, emptyItem, itemLike, emptyItem, itemBack, emptyItem, itemForward, emptyItem,];
    } else {
        NSLog(@"当前控制器不是导航控制器的子控制器");
    }
}

- (void)goHistory {
    HistoryTableViewController *controller = [[HistoryTableViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)goLike {
    // 用户单击收藏按钮后，先弹出一个活动列表，里面有添加收藏、查看收藏夹、取消三种操作
    // 单击添加收藏后，将当前的网址添加到数组并通过 UserDefaults 进行本地化保存，USerDefaults 是 iOS 常用的简单数据本地化的方式之一，其原理试讲常用的数据类型存储为 plist 文件。
    // 单击查看收藏夹后，将进行 LikeTableViewController 的创建并将其 push 出来
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请选择您要进行的操作" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"添加收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *array = [[NSUserDefaults standardUserDefaults] valueForKey:@"Like"];
        if (!array) {
            array = [[NSArray alloc] init];
        }
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:array];
        [newArray addObject:self.webView.URL.absoluteString];
        [[NSUserDefaults standardUserDefaults] setValue:newArray forKey:@"Like"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"查看收藏夹" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LikeTableViewController *controller = [[LikeTableViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [alert addAction:action2];
    [alert addAction:action3];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)goBack {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

- (void)goForward {
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
}

- (void)loadURL:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", urlStr]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

// 当 WKWebView 加载完成后，将加载的网址通过 NSUserDefaults 写入本地进行保存
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.titleLabel.text = webView.URL.absoluteString;
    NSArray *array = [[NSUserDefaults standardUserDefaults] valueForKey:@"History"];
    if (!array) {
        array = [[NSArray alloc] init];
    }
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:array];
    [newArray addObject:self.titleLabel.text];
    [[NSUserDefaults standardUserDefaults] setValue:newArray forKey:@"History"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// 由于WKWebView 自带滑动手势，如果开发者不处理，WKWebView 的滑动手势和开发者添加的滑动手势就会冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (gestureRecognizer == self.upSwipe || gestureRecognizer == self.downSwipe) {
        return YES;
    }
    return NO;
}


// 扩展内容
// UserDefaults 采用单例的设计模式，在项目工程的任何地方都可以方便地进行数据存取和统一管理
// standard 用于获取单例对象，setValue:forKey 用于数据的存入，synchronize 方法用于将存入的数据同步到磁盘存在本地，valueForKey 方法用于获取存储的本地数据


// 遇到的问题
//  1、点击收藏并没有弹起活动列表框
//    原因是没有添加[self presentViewController:alert animated:YES completion:nil];这段代码，将活动列表显示在当前视图控制器上面
//  2、没有显示 createToolBar 中创建的四个功能按钮
//    原因是当前控制器不是导航控制器的子控制器，在添加导航控制器时添加错了位置，应该在 Mian.stroryboard 里面添加
//  3、createToolBar 中创建的四个功能按钮没有达到期望的居中显示
//    原因是使用了 UIBarButtonSystemItemFixedSpace 来创建占位符的 UIBarButtonItem 对象，这个占位符的宽度是固定的。应该使用UIBarButtonSystemItemFlexibleSpace 来创建占位符的 UIBarButtonItem 对象，这个占位符的宽度是可变的。
@end
