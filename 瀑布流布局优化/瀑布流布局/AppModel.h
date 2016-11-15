//
//  AppModel.h
//  瀑布流布局
//
//  Created by lihonggui on 2016/11/14.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject
@property(nonatomic,copy) NSString *img;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,assign) NSInteger h;
@property(nonatomic,assign) NSInteger w;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appModelWithDict:(NSDictionary *)dict;
@end
