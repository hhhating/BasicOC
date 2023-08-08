//
//  HistoryTableViewController.m
//  Browser
//
//  Created by ByteDance on 2023/7/19.
//

#import "HistoryTableViewController.h"
#import "ViewController.h"
@interface HistoryTableViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation HistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 将网页的历史记录读取为数组，并创建了一个导航栏右侧按钮用于清空历史数据
    self.dataArray = [[NSUserDefaults standardUserDefaults] valueForKey:@"History"];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Delete All" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAll)];
    self.navigationItem.rightBarButtonItem = item;
}

// 将本地记录数据清除，然后将数据源清空并重新刷新表格视图
- (void)deleteAll {
    [[NSUserDefaults standardUserDefaults] setValue:[[NSArray alloc] init] forKey:@"History"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.dataArray = @[];
    [self.tableView reloadData];
}

// 将 UITableView 中的分区设为 1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
// 将分区的行数与数据源中数据个数相对应
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}
// 当用户单击某一行时，通过导航控制器的 viewControllers 属性获取到导航的根视图控制器，让其加载用户单击行的网址数据，并使界面弹回核心网页浏览界面
// 导航间直接获取的 ViewController 需要进行强转操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [(ViewController *)self.navigationController.viewControllers.firstObject loadURL:self.dataArray[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

// 当用户进入到历史界面的时候应该将导航的工具栏收起，离开的时候再将导航的工具栏展示出来
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.toolbarHidden = NO;
}

@end
