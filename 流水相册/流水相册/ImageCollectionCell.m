//
//  ImageCollectionCell.m
//  流水相册
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ImageCollectionCell.h"
@interface ImageCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation ImageCollectionCell

-(void)setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = image;
}
@end
