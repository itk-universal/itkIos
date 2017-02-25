//
//  ThemeButton.m
//  PR
//
//  Created by 黄小雪 on 09/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "ThemeButton.h"

@implementation ThemeButton

+(instancetype)buttonWithType:(UIButtonType)buttonType{
    ThemeButton *button = [super buttonWithType:buttonType];
    button.backgroundColor = UIColorFromRGB(0x2cdbc7);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.borderColor = UIColorFromRGB(0x2cdbc7).CGColor;
    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = 2.0;
    button.layer.masksToBounds = YES;
    return button;
}

-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = UIColorFromRGB(0x2cdbc7);
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.borderColor = UIColorFromRGB(0x2cdbc7).CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 2.0;
        self.layer.masksToBounds = YES;
    }
    return self;
}

-(void)setType:(CustomBtnType)type{
    _type = type;
    if (type == CustomBtnTypeWhiteBg) {
        self.backgroundColor   = [UIColor whiteColor];
        [self setTitleColor:UIColorFromRGB(0x2cdbc7) forState:UIControlStateNormal];
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }else if (CustomBtnTypeGreenBg){
        self.backgroundColor = UIColorFromRGB(0x2cdbc7);
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.borderColor = UIColorFromRGB(0x2cdbc7).CGColor;
    }
}
@end
