//
//  ProductInfo.h
//  PR
//
//  Created by 黄小雪 on 20/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "YHDataModel.h"

@interface ProductInfo : YHDataModel

@property (readonly,nonatomic) BOOL isSeleted;
@property (readonly,nonatomic) NSString *imageURL;
@property (readonly,nonatomic) NSString *title;
/**
 *  规格
 */
@property (readonly,nonatomic) NSString *spec;
@property (readonly,nonatomic) NSString *price;
/**
 *  商品数量
 */
@property (readonly,nonatomic) NSInteger num;
/**
 *  库存数量
 */
@property (readonly,nonatomic) NSInteger stockNum;
/**
 *  是否库存不足
 */
@property (readonly,nonatomic) BOOL  isOutOfStock;
/**
 *  是否已下架
 */
@property (readonly,nonatomic) BOOL  isOffShelve;
/**
 *  是否超出配送范围
 */
@property (readonly,nonatomic) BOOL  isOutOfDelivery;

@end
