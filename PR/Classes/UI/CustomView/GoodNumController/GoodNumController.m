//
//  GoodNumController.m
//  PR
//
//  Created by 黄小雪 on 28/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "GoodNumController.h"
#import "NoMenueTextField.h"

#define kWidth  96
#define kHeight 28

@interface GoodNumController()<UITextFieldDelegate>

@property (strong,nonatomic) UIButton         *minusBtn;
@property (strong,nonatomic) UIButton         *addBtn;
@property (strong,nonatomic) NoMenueTextField *textfiled;

@end


@implementation GoodNumController

-(instancetype)init
{
    if (self = [super init]) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal];
        [_addBtn setImage:[UIImage imageNamed:@"+hui"] forState:UIControlStateDisabled];
        [_addBtn setBackgroundColor:[UIColor clearColor]];
        [_addBtn addTarget:self action:@selector(addBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
        [_addBtn setContentMode:UIViewContentModeRight];
        [self addSubview:_addBtn];
        
        
        _minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_minusBtn setImage:[UIImage imageNamed:@"_"] forState:UIControlStateNormal];
        [_minusBtn setImage:[UIImage imageNamed:@"_-not-optional"] forState:UIControlStateDisabled];
        [_minusBtn setBackgroundColor:[UIColor clearColor]];
        [_minusBtn setContentMode:UIViewContentModeLeft];
        [_minusBtn addTarget:self action:@selector(minusBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_minusBtn];
        
        _textfiled = [[NoMenueTextField alloc]init];
        [_textfiled setTextAlignment:NSTextAlignmentCenter];
        [_textfiled setBorderStyle:UITextBorderStyleNone];
        [_textfiled setFont:KFontNormal(16)];
        [_textfiled setTextColor:UIColorFromRGB(0xfd7622)];
        [_textfiled setBackgroundColor:[UIColor clearColor]];
        _textfiled.delegate = self;
        [self addSubview:_textfiled];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat margin         = 10;
    CGFloat tempBtnW       = 28;
    CGFloat btnW           = tempBtnW + margin;
    CGFloat btnH           = kHeight + 10;
    self.minusBtn.frame    = CGRectMake(-margin, 0, btnW, btnH);
    self.minusBtn.centerY  = kHeight/2.0;
    self.textfiled.frame   = CGRectMake(self.minusBtn.right, 11.5,kWidth-2*tempBtnW, kHeight);
    self.textfiled.centerY = kHeight/2.0;
    self.addBtn.frame      = CGRectMake(self.textfiled.right,0, btnW,kHeight + 10);
    self.addBtn.centerY    = kHeight/2.0;
}

-(void)setProduct:(ProductInfo *)product
{
    CONDITION_CHECK_RETURN([product isKindOfClass:[ProductInfo class]]);
    
}
#pragma mark 按钮事件
-(void)addBtnOnClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goodNumControllerNumChanged:changeToNum:)]) {
        [self.delegate goodNumControllerNumChanged:self changeToNum:[self.textfiled.text integerValue] + 1];
    }
}

-(void)minusBtnOnClick
{
    NSInteger changeNum = [self.textfiled.text integerValue] - 1;
    if (self.product.stockNum &&
        [self.textfiled.text integerValue] > self.product.stockNum) {
        changeNum = self.product.stockNum;
    }
    [self.delegate goodNumControllerNumChanged:self changeToNum:self.product.stockNum];
}

#pragma mark textfiled的代理

//限制只能输入数字
-(BOOL)validateNumber:(NSString *)numberString
{
    BOOL res = YES;
    NSCharacterSet *temSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSInteger i = 0;
    while (i < [numberString length]) {
        NSString *string = [numberString substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:temSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i ++;
    }
    return res;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goodNumControllerTextFiledDidBeginEditing:)]) {
        [self.delegate goodNumControllerTextFiledDidBeginEditing:self];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goodNumControllerTextFiledDidFinshedEdited:)]) {
        [self.delegate goodNumControllerTextFiledDidFinshedEdited:self];
    }
}
@end
