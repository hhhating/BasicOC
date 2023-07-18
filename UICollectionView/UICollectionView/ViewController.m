//
//  ViewController.m
//  UICollectionView
//
//  Created by ByteDance on 2023/7/18.
//

#import "ViewController.h"
#import "MyLayout.h"
@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController
/// 由于 UITableView 有很多的局限性，例如：UITableView 只允许表格纵向排列，不允许横向排列
/// UITableView 每一行只能有一个数据载体 cell，不支持在一行中排列多个数据载体
/// 对于上面这些复杂的布局需求，UICollectionView 可以提供更好的支持
/// UICollectionView 的优势如下：
///  1、支持水平方向和竖直方向两个方向的布局
///  2、通过UICollectionLayout 类配置的方式进行界面布局
///  3、类似于 UITableView 的 cell，UIConlectionView 中的数据载体 item 的大小和位置更加灵活
///  4、通过 UICollectionViewLayoutDelegate 协议方法可以动态地对布局进行重设
///  5、支持完全自定义的 UICollectionLayout 子类进行各种复杂布局

// 单独的 UICollectionView 使用 demo
- (void)viewDidLoad {
    [super viewDidLoad];
    // 使用 UICollectionViewFlowLayout 对 UICollectionView 的布局进行支持，UICollectionViewFlowLayout 是系统提供的一个流式布局类
    /// 流布局又称瀑布流布局，是一种比较流行的网页布局模式，视觉效果多表现为参差不齐的多栏布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // scrollDirection 用于设置布局的方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置 UICollectionVIew 中每个数据载体 item 的尺寸大小
    layout.itemSize = CGSizeMake(100, 100);
    // 设置了最小行间距和最小列间距后，UICollectionView 会自动根据每个 item 的尺寸计算每行可以排列多少个 item
    // 最小行间距
    layout.minimumLineSpacing = 30;
    // 最小列间距
    layout.minimumInteritemSpacing = 10;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    // 注册数据，UICollectionView 内部也有一套复用机制对注册的数据载体进行复用
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
}

// 设置分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 每个分区载体 item 数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

// 设置每条数据载体的 item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

// 灵活设置 UICollectionView 中每个 item 的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        return CGSizeMake(50, 50);
    } else {
        return CGSizeMake(100, 100);
    }
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    MyLayout *layout = [[MyLayout alloc] init];
//    layout.itemCount = 20;
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
//    collectionView.backgroundColor = [UIColor whiteColor];
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
//    [self.view addSubview:collectionView];
//}
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 20;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
//    return cell;
//}

@end
