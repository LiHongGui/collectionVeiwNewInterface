//
//  ViewController.m
//  流水相册
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionCell.h"
#define kCount 10
@interface ViewController ()<UICollectionViewDataSource>

@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSMutableArray *mutb = [NSMutableArray array];
        for (int i = 0; i <kCount ; i++) {
            
            NSString *imageNamed = [NSString stringWithFormat:@"zilong"];
            UIImage *image = [UIImage imageNamed:imageNamed];
            [mutb addObject:image];
        }
        _dataArray = mutb;
    }
    return _dataArray;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionCell" forIndexPath:indexPath];
    UIImage *image = self.dataArray[indexPath.row];
    cell.image = image;
    return cell;
}
@end
