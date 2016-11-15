//
//  collectionCell.m
//  collectionView新特性
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "collectionCell.h"
@interface collectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation collectionCell


-(void)setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = image;
}
-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    _label.text = [NSString stringWithFormat:@"%ld/%ld",(long)indexPath.section,(long)indexPath.row];
}
@end
