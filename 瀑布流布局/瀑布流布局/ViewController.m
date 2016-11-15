//
//  ViewController.m
//  瀑布流布局
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "AppCell.h"
#import "AppModel.h"
#import "CollectionFlowLayout.h"
@interface ViewController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet CollectionFlowLayout *flowLayout;

@property(nonatomic,strong) NSMutableArray *mutbArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    CollectionFlowLayout *flow = _flowLayout;
    flow.flowArray = self.mutbArray;
    
}
-(NSMutableArray *)mutbArray
{
    if (_mutbArray == nil) {
        _mutbArray = [NSMutableArray array];
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"shop.plist" ofType:nil];
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];
        for (NSDictionary *dict in temp) {
            AppModel *appModel = [AppModel appModelWithDict:dict];
            [_mutbArray addObject:appModel];
        }
    }
    return _mutbArray;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.mutbArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"App" forIndexPath:indexPath];
    AppModel *appModel = self.mutbArray[indexPath.row];
    cell.appModel = appModel;
    
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}
@end
