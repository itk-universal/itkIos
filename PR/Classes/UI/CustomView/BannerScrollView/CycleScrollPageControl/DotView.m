//
//  DotView.m
//  PR
//
//  Created by 黄小雪 on 17/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "DotView.h"

@implementation DotView

-(instancetype)init{
    if (self = [super init]) {
        [self initialization];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialization];
    }
    return self;
}


- (void)initialization
{
    self.backgroundColor    = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame)/2.0;
    self.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.layer.borderWidth  = 0.5;
}

-(void)changeActivityState:(BOOL)active{
    if (active) {
        self.backgroundColor = [UIColor lightGrayColor];
    }else{
        self.backgroundColor = [UIColor whiteColor];
    }
}
@end
