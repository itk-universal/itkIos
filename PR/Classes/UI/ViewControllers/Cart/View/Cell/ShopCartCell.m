//
//  ShopCartCell.m
//  PR
//
//  Created by 黄小雪 on 20/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "ShopCartCell.h"
#import "CartProductInfo.h"
#import "OnePixelSepView.h"

@interface EditingView : UIView

@property (strong,nonatomic) UIView *numController;
@property (strong,nonatomic) UILabel *priceLabel;
@property (strong,nonatomic) UIButton *deleteBtn;

@end

@implementation EditingView
-(instancetype)init
{
    if (self = [super init]) {
        _numController = [[UIView alloc]init];
        [_numController setBackgroundColor:[UIColor brownColor]];
        [self addSubview:_numController];
        
        _priceLabel = [[UILabel alloc]init];
        [_priceLabel setText:@"xxxx"];
        [_priceLabel setTextColor:kColorRed];
        [_priceLabel setFont:KFontNormal(12)];
        [_priceLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_priceLabel];
        
        _deleteBtn = [[UIButton alloc]init];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteBtn setBackgroundColor:kColorRed];
        [self addSubview:_deleteBtn];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat deleteBtnW       = 35;
    self.deleteBtn.frame     = CGRectMake(self.width - deleteBtnW, 0, deleteBtnW, self.height);
    CGFloat leftMargin       = 15;
    CGFloat numControllerW   = self.width - 2*leftMargin - deleteBtnW;
    self.numController.frame = CGRectMake(leftMargin, 10, numControllerW, 35);
    self.priceLabel.frame    = CGRectMake(leftMargin, 0, numControllerW, 21);
    self.priceLabel.bottom   = self.height;
}
@end

@interface DetailView:UIView

@property (strong,nonatomic) UILabel         *titleLabel;
@property (strong,nonatomic) UILabel         *subTitleLabel;
@property (strong,nonatomic) UILabel         *priceLabel;
@property (strong,nonatomic) UILabel         *numLabel;
@property (strong,nonatomic) CartProductInfo *product;

@end

@implementation DetailView
-(instancetype)init{
    if (self = [super init]) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setText:@"xxxxxxxxx"];
        [_titleLabel setTextColor:kColorNormal];
        [_titleLabel setFont:KFontNormal(14)];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        _titleLabel.numberOfLines = 2;
        [self addSubview:_titleLabel];
        
        _subTitleLabel = [[UILabel alloc]init];
        [_subTitleLabel setText:@"xxxxxx"];
        [_subTitleLabel setTextColor:kColorGray];
        [_subTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_subTitleLabel];
        
        _priceLabel = [[UILabel alloc]init];
        [_priceLabel setText:@"xxxx"];
        [_priceLabel setTextColor:kColorRed];
        [_priceLabel setFont:KFontNormal(12)];
        [_priceLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_priceLabel];
        
        _numLabel = [[UILabel alloc]init];
        [_numLabel setFont:KFontNormal(12)];
        [_numLabel setTextColor:kColorGray];
        [_numLabel setTextAlignment:NSTextAlignmentLeft];
        [_numLabel setText:@"xxxx"];
        [self addSubview:_numLabel];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGSize tempSize = [self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat titleLabelW = tempSize.width;
    CGFloat titleLabelH = tempSize.height;
    if (titleLabelW > self.width) {
        titleLabelH = 2*titleLabelH;
    }
    self.titleLabel.frame    = CGRectMake(0, 10, self.width, titleLabelH);
    self.subTitleLabel.frame = CGRectMake(0, self.titleLabel.bottom + 5, self.width, 18);
    self.numLabel.frame      = CGRectMake(0, 0, 40, 18);
    self.numLabel.bottom     = self.height;
    self.priceLabel.frame    = CGRectMake(0, 0, self.width - self.numLabel.width, 18);
    self.priceLabel.bottom   = self.height - self.titleLabel.top;
    
}
@end

@interface ShopCartCell()

@property (strong,nonatomic) UIButton    *seletedBtn;
@property (strong,nonatomic) UIImageView *goodImageView;
@property (strong,nonatomic) DetailView  *detailView;
@property (strong,nonatomic) EditingView *editingView;

@end
@implementation ShopCartCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _seletedBtn         = [UIButton  buttonWithType:UIButtonTypeSystem];
        [_seletedBtn setBackgroundColor:[UIColor redColor]];
        [_seletedBtn setTitle:@"未" forState:UIControlStateNormal];
        [_seletedBtn setTitle:@"中" forState:UIControlStateSelected];
        [_seletedBtn setTitle:@"非" forState:UIControlStateDisabled];
        [self.contentView addSubview:_seletedBtn];

        _goodImageView      = [[UIImageView alloc]init];
        [_goodImageView setBackgroundColor:kColorGray];
        [self.contentView addSubview:_goodImageView];

        _detailView         = [[DetailView alloc]init];
        [self.contentView addSubview:_detailView];

        _editingView        = [[EditingView alloc]init];
        _editingView.hidden = YES;
        [self.contentView addSubview:_editingView];
        
        [self.contentView setBackgroundColor:kColorTheme];
        [self.contentView setPixelSepSet:PSRectEdgeBottom];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat seletedBtnW      = 25;
    self.seletedBtn.frame    = CGRectMake(0, 0, seletedBtnW, self.width);
    CGFloat goodImageViewW   = 65;
    self.goodImageView.frame = CGRectMake(self.seletedBtn.right, (self.height - goodImageViewW)/2.0, goodImageViewW, goodImageViewW);
    self.detailView.frame    = CGRectMake(self.goodImageView.right, 0, self.width - self.goodImageView.right - 15, self.height);
    
    self.editingView.frame   = self.detailView.frame;
}



+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object
{
    return 95;
}
@end
