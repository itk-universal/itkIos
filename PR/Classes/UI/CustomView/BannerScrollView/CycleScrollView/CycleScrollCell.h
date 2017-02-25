//
//  CycleScrollCell.h
//  PR
//
//  Created by 黄小雪 on 16/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleScrollCell : UICollectionViewCell

@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) NSString    *title;
@property (strong,nonatomic) UIColor     *titleLabelTextColor;
@property (strong,nonatomic) UIFont      *titleLabelTextFont;
@property (strong,nonatomic) UIColor     *titleLabelBackgroundColor;
@property (assign,nonatomic) CGFloat     titleLabelHeight;
@property (assign,nonatomic) BOOL        hasConfigured;

@end
