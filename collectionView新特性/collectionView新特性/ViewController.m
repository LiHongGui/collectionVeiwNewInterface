//
//  ViewController.m
//  collectionView新特性
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "collectionCell.h"
#define kCount 109
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;
@property(nonatomic,strong) NSArray *dataArray;


@end

@implementation ViewController

-(NSArray *)dataArray
{
    if (_dataArray == nil) {
        NSMutableArray *mutb = [NSMutableArray array];
        for (int i = 1; i < kCount; i++) {
            
            NSString *imageNamed = [NSString stringWithFormat:@"%08d.jpg",i+1];
            UIImage *image = [UIImage imageNamed:imageNamed];
            
            [mutb addObject:image];
        }
        _dataArray = mutb;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionViewFlowLayout.itemSize = self.view.frame.size;
    self.collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;
    self.collectionViewFlowLayout.minimumLineSpacing = 0;

}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   collectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collection"  forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
   UIImage *image = self.dataArray[indexPath.item];
    cell.image = image;
    cell.indexPath = indexPath;
    return cell;
    
}
@end
