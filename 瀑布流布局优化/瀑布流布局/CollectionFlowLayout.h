//
//  CollectionFlowLayout.h
//  瀑布流布局
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionFlowLayout;
@protocol CollectionFlowLayoutDelegate <NSObject>

//设置代理
-(CGFloat)collectionFlowLayout:(CollectionFlowLayout*)collectionFlowLayout WithIndexPath:(NSIndexPath *)indexPath andWidth:(NSInteger)Width;


@end
@interface CollectionFlowLayout : UICollectionViewFlowLayout

//设置数组---与ViewController对应
//@property(nonatomic,strong) NSArray *flowArray;

@property(nonatomic,weak)  id<CollectionFlowLayoutDelegate>delegate;
@end
