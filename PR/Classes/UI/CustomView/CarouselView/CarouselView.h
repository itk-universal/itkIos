//
//  CarouselView.h
//  YHClouds
//
//  Created by 黄小雪 on 08/03/2017.
//  Copyright © 2017 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarouselView : UIView
@property (assign,nonatomic) NSInteger itemViewW;
-(void)setImageUrl:(NSArray *)imageUrls titles:(NSArray *)titles;
@end
