//
//  CouponModel.h
//  PR
//
//  Created by 黄小雪 on 21/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "YHDataModel.h"

@interface CouponModel : YHDataModel
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *desc;
@property (copy,nonatomic) NSString *dateString;
@property (copy,nonatomic) NSString *cid;
@end
