//
//  HomeProductCell.m
//  PR
//
//  Created by 黄小雪 on 06/03/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "HomeThressProductCell.h"
#import "ProductImageView2.h"
#import "DynamicUIModel.h"
#import "ProductInfo.h"

#define kBaseTag 1000
@interface HomeThressProductCell()
@property (strong,nonatomic) NSMutableArray *reusePool;
@property (strong,nonatomic) UIView *containView;
@end

@implementation HomeThressProductCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _containView = [[UIView alloc]init];
        [_containView setBackgroundColor:[UIColor whiteColor]];
        [self.containView addSubview:_containView];
    }
    return self;
}
-(NSMutableArray *)reusePool
{
    if (!_reusePool) {
        _reusePool = [NSMutableArray arrayWithCapacity:3];
    }
    return _reusePool;
}

-(void)setObject:(id)object
{
    CONDITION_CHECK_RETURN([object isKindOfClass:[DynamicCardItem class]]);
    DynamicCardItem *cardItem = (DynamicCardItem *)object;
    NSArray *products = cardItem.data;
    [self addProductView:products];
    
}

-(void)addProductView:(NSArray *)products
{
    NSInteger index = 0;
    for (ProductInfo *info in products) {
        if ([info isKindOfClass:[ProductInfo class]]) {
            ProductImageView2 *productView = (ProductImageView2 *)[self.containView findASubViewWithTag:index + kBaseTag];
            if (productView == nil) {
                productView = [[ProductImageView2 alloc]init];
                productView.tag = index + kBaseTag;
                [self.containView addSubview:productView];
            }
            [productView setInfo:info];
            index ++;
        }
    }
    [self removeUnUseView:index];
}


-(void)removeUnUseView:(NSInteger)index
{
    while (true) {
        ProductImageView2 *productView = (ProductImageView2 *)[self.containView findASubViewWithTag:index + kBaseTag];
        if (productView == nil) {
            break;
        }else{
            [productView removeFromSuperview];
            index ++;
        }
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat kMargin = 5;
    CGFloat kProductViewW = (self.width - 2*kMargin)/3.0;
    CGFloat kProudctViewH = 100;
    for (ProductImageView2 *productView in self.containView.subviews) {
        NSInteger row = (productView.tag - kBaseTag)/3;
        NSInteger column = (productView.tag - kBaseTag)%3;
        CGFloat productViewX = (column - 1)*kProductViewW + column*kMargin;
        CGFloat productViewY =  (row - 1)*(kProudctViewH + kMargin);
        productView.frame = CGRectMake(productViewX, productViewY, kProductViewW, kProudctViewH);
    }
}
@end
