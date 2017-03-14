//
//  CarouselItemView.h
//  PR
//
//  Created by 黄小雪 on 10/03/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CarouselItemView;

@protocol CarouselItemViewDelegate  <NSObject>
-(void)carouselItemViewDidSeleted:(CarouselItemView *)itemView;
@end


@interface CarouselItemView : UIView
-(void)setImageUrl:(NSString *)imageurl
             title:(NSString *)title
             index:(NSInteger)index;
@property (weak,nonatomic) id<CarouselItemViewDelegate> delegate;
@property (readonly,nonatomic) NSInteger index;

@end
