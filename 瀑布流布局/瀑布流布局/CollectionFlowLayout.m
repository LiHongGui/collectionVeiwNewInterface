//
//  CollectionFlowLayout.m
//  瀑布流布局
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "CollectionFlowLayout.h"
#import "AppModel.h"
@interface CollectionFlowLayout ()
//保存最短的cell的最大y值
@property(nonatomic,strong) NSMutableArray *mutbArray;
@end
@implementation CollectionFlowLayout
  static NSInteger row = 3;
-(NSMutableArray *)mutbArray
{
    if (_mutbArray == nil) {
        _mutbArray = [NSMutableArray array];
    }
    return _mutbArray;
}
#warning 初始化不要放在这里,因为collectionView还没有实例化,是取不到方法的
-(instancetype)init
{
    if (self = [super init]) {
        
        
        
    }
    return self;
}
#warning 当视图开始,或者发生变化时,调用
-(void)prepareLayout
{
    [super prepareLayout];
}
#pragma mark
#pragma mark -  返回所有的控件属性(包含可是界面)
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //间距
    
    CGFloat margin = 10;
    
    NSInteger list = 3;
    CGFloat topMargin,leftMargin,bottomMargin,rightMargin;
    topMargin = leftMargin = bottomMargin = rightMargin = 10;
   
    #warning y值:视图中最短的那个cell的最大y值
//    _mutbArray = [NSMutableArray array];
    //假设是数组中的第一个,通过判断比较得出
    CGFloat minMaxY = [self.mutbArray[0]doubleValue];
    //最短的cell对应的数
    NSInteger minNumber = 0;
    //i=1,因为上面已经假设是第0个是最大值
    for (int i = 1; i<row; i++) {
        //取出循环变量中的值
        CGFloat array = [self.mutbArray[i]doubleValue];
        if (minMaxY > array) {
            minMaxY = array;
             minNumber = i;
        }
    }
    CGFloat width = (self.collectionView.frame.size.width - rightMargin - leftMargin - margin*(list - 1))/row;
    //随机height
//    CGFloat height = arc4random_uniform(100) + 100;
    
    AppModel *model = _flowArray[indexPath.row];
    CGFloat height = width*model.h/model.w;
    CGFloat x = minNumber*width + minNumber*margin +leftMargin;
    CGFloat y = minMaxY + margin;
    self.sectionInset = UIEdgeInsetsMake(topMargin, leftMargin, bottomMargin, rightMargin);
    //取出控件属性
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectMake(x, y, width, height);
    #warning 需要把得到的cell添加到数组中,否者会导致崩溃
    self.mutbArray[minNumber] = @(CGRectGetMaxY(attributes.frame));
    return attributes;
}
#pragma mark
#pragma mark -  返回可是界面所有的空间属性
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //
    [self.mutbArray removeAllObjects];
    #warning 对数组进行初始化--在这里初始化(只会运行一次)
    for (int i = 0; i < row; i++) {
        [self.mutbArray addObject:@0];
    }
    NSMutableArray *mutb = [NSMutableArray array];
    //可视界面有多少个cell
    NSInteger item = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i <item ; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        //添加到可变数组中
        [mutb addObject:att];
    }
    return mutb;
}

#pragma mark
#pragma mark -  预估高度(collectionView的高度是最大的那个cell的最大y值
-(CGSize)collectionViewContentSize
{
    CGFloat maxY = 0;
    //因为collectionView还没有实例化(程序会先运行这个)
    if (self.mutbArray.count) {
        maxY = [self.mutbArray[0]doubleValue];
        
        for (int i = 1; i < row; i++) {
            CGFloat item = [self.mutbArray[i]doubleValue];
            if (maxY < item ) {
                maxY = item;
            }
        }
    }
    return CGSizeMake(0, maxY + 10);
}
@end
