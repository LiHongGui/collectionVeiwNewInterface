//
//  FlowLayout.m
//  流水相册
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#warning 设置图片流水布局的样式---图片放大,缩小
#import "FlowLayout.h"
@interface FlowLayout()

@end
@implementation FlowLayout
//初始布局
-(void)prepareLayout
{
    //首位间距
    CGFloat margin = self.collectionView.frame.size.width/2 - self.itemSize.width/2;
    self.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
}
#pragma mark
#pragma mark -  返回视图内所有的属性---可对item进行更改
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    attribute.size = CGSizeMake(200, 200);
    
    //取出所有的item
    NSArray *superAttributes = [super layoutAttributesForElementsInRect:rect];
    //取出屏幕的中心点:屏幕的中心+ item的一半
//    CGFloat center = self.collectionView.contentOffset.x +self.itemSize.width/2;
    //取出屏幕的中心点:屏幕的中心+ 偏移量
    CGFloat center = self.collectionView.contentOffset.x + self.collectionView.frame.size.width/2;
    
    //遍历
    for (UICollectionViewLayoutAttributes *atttibutes in superAttributes) {
        //计算差值---ABS:绝对值
        CGFloat result = ABS(center - atttibutes.center.x);
        CGFloat item = result/300;
        CGFloat resultItem = 1.1 -item;
        NSLog(@"result%f",resultItem);
        atttibutes.transform = CGAffineTransformMakeScale(resultItem, resultItem);
        
        
    }
    return superAttributes;
}


#pragma mark
#pragma mark -  当屏幕发生变化是,要重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    
    return YES;
}
#pragma mark
#pragma mark -  设置滚动后图片停留的位置
/*
 targetContentOffset:本该停留的位置(对这个进行干预,使其停留在中心
 ProposedContentOffset:应该停留的位置
 velocity:速率(手指拖拽的力度)
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //取出属性---先赋值为0,在进行改变
    CGRect item = CGRectZero;
    item.size = self.collectionView.frame.size;
    //位置就是应该停留的位置
    item.origin = proposedContentOffset;
    NSArray *attributes = [super layoutAttributesForElementsInRect:item];
    //屏幕的中心位置
    CGFloat screen = self.collectionView.frame.size.width/2 +proposedContentOffset.x;
    
    //判断:最小小位置(设置最小位置的值是最大值,然后进行比较)
    CGFloat minPosition = CGFLOAT_MAX;
    //遍历
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        //差值
        CGFloat result = attribute.center.x - screen;
        if (ABS(minPosition) > ABS(result)) {
            minPosition = result;
        }
    }
    return CGPointMake(minPosition + proposedContentOffset.x, proposedContentOffset.y);
}
@end
