//
//  AppCell.m
//  瀑布流布局
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"
@interface AppCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation AppCell

-(void)setAppModel:(AppModel *)appModel
{
    _appModel = appModel;
    NSURL *url = [NSURL URLWithString:appModel.img];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _imageView.image = [UIImage imageWithData:data];
    _priceLabel.text = appModel.price;
//    NSLog(@"%@",appModel.price)
//    ;
//    NSLog(@"%@",NSStringFromCGRect(_priceLabel.frame));
    
}

@end
