//
//  collectionCell.h
//  collectionView新特性
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface collectionCell : UICollectionViewCell

@property(nonatomic,copy) UIImage *image;

//直接检索
@property(nonatomic,weak) NSIndexPath *indexPath;

@end
