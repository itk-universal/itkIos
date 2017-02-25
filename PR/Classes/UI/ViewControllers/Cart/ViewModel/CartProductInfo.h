//
//  CartProductInfo.h
//  PR
//
//  Created by 黄小雪 on 20/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "ProductInfo.h"

typedef NS_ENUM(NSInteger,CartProductType)
{
    CartProductTypeDefault,
    CartProductTypeEditing,
};
@interface CartProductInfo : ProductInfo
@property (assign,nonatomic) CartProductType type;
@end
