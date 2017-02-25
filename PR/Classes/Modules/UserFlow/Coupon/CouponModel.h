//
//  CouponModel.h
//  PR
//
//  Created by 黄小雪 on 21/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "YHDataModel.h"

@interface CouponModel : YHDataModel
@property (readonly,nonatomic) NSString *title;
@property (readonly,nonatomic) NSString *desc;
@property (readonly,nonatomic) NSString *dateString;
@property (readonly,nonatomic) NSString *cid;
@end
