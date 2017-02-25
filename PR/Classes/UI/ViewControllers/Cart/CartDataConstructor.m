//
//  CartDataConstructor.m
//  PR
//
//  Created by 黄小雪 on 21/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "CartDataConstructor.h"
#import "CartProductInfo.h"
#import "ShopCartCell.h"
#import "CartShopInfoModel.h"
#import "CartShopInfoViewCell.h"
#import "SeparateCell.h"


@implementation CartDataConstructor

-(void)constructData
{
    [self.items removeAllObjects];
    
    CartShopInfoModel *shopInfo = [[CartShopInfoModel alloc]init];
    shopInfo.cellType   = @"cartshopInfoViewCell";
    shopInfo.cellClass  = [CartShopInfoViewCell class];
    [self.items addObject:shopInfo];
    
    for (NSInteger i = 0; i < 5; i ++) {
        CartProductInfo *product = [[CartProductInfo alloc]init];
        product.cellType         = @"shopCartCell";
        product.cellClass        = [ShopCartCell class];
        [self.items addObject:product];
    }
    
    SeparateModel *separateModel = [[SeparateModel  alloc]init];
    separateModel.cellClass = [SeparateCell class];
    separateModel.cellType = @"separatecell";
    [self.items addObject:separateModel];
    
    
    CartShopInfoModel *shopInfo2 = [[CartShopInfoModel alloc]init];
    shopInfo2.cellType   = @"cartshopInfoViewCell";
    shopInfo2.cellClass  = [CartShopInfoViewCell class];
    [self.items addObject:shopInfo2];
    
    for (NSInteger i = 0; i < 5; i ++) {
        CartProductInfo *product = [[CartProductInfo alloc]init];
        product.cellType         = @"shopCartCell";
        product.cellClass        = [ShopCartCell class];
        [self.items addObject:product];
    }

}
@end
