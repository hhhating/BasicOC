//
//  LikeTableViewController.m
//  Browser
//
//  Created by ByteDance on 2023/7/19.
//

#import "LikeTableViewController.h"
#import "ViewController.h"
@interface LikeTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation LikeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] valueForKey:@"Like"]];
    // editButtonItem 是 UITableViewController 自带的导航编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除数据并更新本地数据
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setValue:self.dataArray forKey:@"Like"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // 删除行执行的动画效果
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [(ViewController *)self.navigationController.viewControllers.firstObject loadURL:_dataArray[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

// 当用户进入到收藏界面的时候应该将导航的工具栏收起，离开的时候再将导航的工具栏展示出来
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.toolbarHidden = NO;
}
@end
