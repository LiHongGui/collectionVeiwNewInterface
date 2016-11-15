//
//  CollectionFlowLayout.h
//  瀑布流布局
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionFlowLayout : UICollectionViewFlowLayout

//设置数组---与ViewController对应
@property(nonatomic,strong) NSArray *flowArray;
@end
