//
//  MyLayout.m
//  UICollectionView
//
//  Created by ByteDance on 2023/7/18.
//

#import "MyLayout.h"
@interface MyLayout ()
// 这个数组用来自定义的布局配置数组，存放每个 item 布局的相关信息
@property (nonatomic, copy) NSMutableArray *array;
@end

@implementation MyLayout

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}
// 数组的相关设置在这个方法中
// 布局前的准备会调用这个方法
- (void)prepareLayout {
    [super prepareLayout];
    // 为演示方便，设置为静态的2列
    // 计算每一个 item 的宽度
    float WIDTH = ([UIScreen mainScreen].bounds.size.width-self.sectionInset.left - self.sectionInset.right-self.minimumInteritemSpacing)/2;
    // 定义数组保存每一列的高度
    // 这个数组的主要作用是保存每一列的总高度，这样在布局时可以始终将下一个 item 放在最短的列下面
    CGFloat colHight[2] = {self.sectionInset.top, self.sectionInset.top};
    // itemCount 是外界传进来的 item 的个数，遍历设置每一个 item 的布局
    for (int i = 0; i < self.itemCount; i++) {
        // 设置每个 item 的位置等相关属性
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        // 创建一个布局属性类，通过 indexPath 创建
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        // 随机一个高度，在 40~190 之间
        CGFloat hight = arc4random() % 150 + 40;
        // 哪一列高度小，就放在哪一列下面
        // 标记最短的列
        int width = 0;
        if (colHight[0] < colHight[1]) {
            // 将新的 item 高度加入短的一列
            colHight[0] = colHight[0] + hight + self.minimumLineSpacing;
        } else {
            colHight[1] = colHight[1] + hight + self.minimumLineSpacing;
        }
        // 设置 item 的位置
        attris.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + WIDTH) * width, colHight[width] - hight - self.minimumLineSpacing, WIDTH, hight);
        [self.array addObject:attris];
    }
    // 设置 itemSize 确保滑动范围正确，这里是通过将所有 item 高度平均化计算出来的（以最高的列为标准）
    if (colHight[0] > colHight[1]) {
        self.itemSize = CGSizeMake(WIDTH, (colHight[0] - self.sectionInset.top)*2/self.itemCount - self.minimumLineSpacing);
    } else {
        self.itemSize = CGSizeMake(WIDTH, (colHight[1] - self.sectionInset.top)*2/self.itemCount - self.minimumLineSpacing);
    }
}

// 这个方法中返回我们的布局数组，在 prepareLayout 准备好所有 item 的 UICollectionViewLayoutAttributes 后，以数组的形式调用 layoutAttributesElementInRect 方法返回给 UICollectionView 进行界面的布局
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesElementInRect:(CGRect) rect {
    return self.array;
}

@end
