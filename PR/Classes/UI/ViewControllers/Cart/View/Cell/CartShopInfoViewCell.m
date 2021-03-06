//
//  CartShopInfoVieCell.m
//  PR
//
//  Created by 黄小雪 on 21/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "CartShopInfoViewCell.h"
#import "CouponsSelectView.h"

@interface CartShopInfoViewCell()

@property (strong,nonatomic) UIButton *seleteBtn;
@property (strong,nonatomic) UILabel *shopIconLabel;
@property (strong,nonatomic) UILabel *shopNameLabel;
@property (strong,nonatomic) UILabel *arrowLabel;
@property (strong,nonatomic) UIButton *eidtBtn;
@property (strong,nonatomic) UIButton *couponBtn;
@property (strong,nonatomic) CouponsSelectView *couponsView;

@end

@implementation CartShopInfoViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _seleteBtn                  = [[UIButton alloc]init];
        [_seleteBtn setBackgroundColor:[UIColor redColor]];
        [_seleteBtn setTitle:@"未" forState:UIControlStateNormal];
        [_seleteBtn setTitle:@"中" forState:UIControlStateSelected];
        [_seleteBtn setTitle:@"非" forState:UIControlStateDisabled];
        [_seleteBtn addTarget:self action:@selector(seleteBtnOnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_seleteBtn];
        
        _shopIconLabel              = [[UILabel alloc]init];
        [_shopIconLabel setBackgroundColor:[UIColor orangeColor]];
        [self addSubview:_shopIconLabel];
        
        _shopNameLabel              = [[UILabel alloc]init];
        [_shopNameLabel setText:@"xxxxx"];
        [_shopNameLabel setTextColor:kColorNormal];
        [_shopNameLabel setFont:KFontNormal(14)];
        [self addSubview:_shopNameLabel];
        
        _arrowLabel                 = [[UILabel alloc]init];
        [_arrowLabel setBackgroundColor:[UIColor brownColor]];
        [self addSubview:_arrowLabel];
        
        _eidtBtn                    = [UIButton buttonWithType:UIButtonTypeSystem];
        [_eidtBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_eidtBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_eidtBtn setTitle:@"完成" forState:UIControlStateSelected];
        [_eidtBtn addTarget:self action:@selector(eidtBtnOnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_eidtBtn];
        
        _couponBtn                  = [UIButton buttonWithType:UIButtonTypeSystem];
        [_couponBtn setTitle:@"领券" forState:UIControlStateNormal];
        [_couponBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_couponBtn addTarget:self action:@selector(couponeBtnOnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_couponBtn];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapShopName)];
        [self.shopNameLabel addGestureRecognizer:tap];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat seleteBtnW       = 35;
    self.seleteBtn.frame     = CGRectMake(0, 0, seleteBtnW, self.height);
    
    CGFloat shopIconLabelW   = 15;
    self.shopIconLabel.frame = CGRectMake(self.seleteBtn.right, (self.height - shopIconLabelW)/2.0, shopIconLabelW, shopIconLabelW);
    
    CGFloat shopNameLabelW   = [self.shopIconLabel sizeThatFits:CGSizeMake(MAXFLOAT, self.height)].width;
    self.shopNameLabel.frame = CGRectMake(self.shopIconLabel.right + 5, 0, shopNameLabelW, self.height);
    
    CGFloat arrowLabelW      = 6;
    CGFloat arrowLabelH      = 11;
    self.arrowLabel.frame    = CGRectMake(self.shopIconLabel.right + 5,(self.height - arrowLabelH)/2.0, arrowLabelW, arrowLabelH);
    
    CGFloat editBtnW         = 40;
    self.eidtBtn.frame       = CGRectMake(self.width - editBtnW, 0, editBtnW, self.height);
    self.couponBtn.frame     = CGRectMake(self.eidtBtn.left - editBtnW, 0, editBtnW, self.height);
}


-(void)couponeBtnOnClicked:(UIButton *)sender
{
    if(self.couponsView == nil){
        self.couponsView = [CouponsSelectView defaultCouponsSelectView];
    }
    [self.couponsView setCouponsList:nil];
    [self.couponsView show];
}

-(void)eidtBtnOnClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
}
-(void)seleteBtnOnClicked
{
    
}

-(void)tapShopName
{
    NSLog(@"tap店铺名称");
}

@end
