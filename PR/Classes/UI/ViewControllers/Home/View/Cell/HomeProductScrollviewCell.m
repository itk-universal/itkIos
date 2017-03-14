//
//  HomeProductScrollviewCell.m
//  PR
//
//  Created by 黄小雪 on 10/03/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "HomeProductScrollviewCell.h"
#import "CarouselView.h"

@interface HomeProductScrollviewCell()
@property (strong,nonatomic) CarouselView *carouseView;
@end

@implementation HomeProductScrollviewCell
-(instancetype)init
{
    if (self = [super init]) {
        _carouseView = [[CarouselView alloc]init];
        [self.contentView addSubview:_carouseView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.carouseView.frame = self.bounds;
}
@end
