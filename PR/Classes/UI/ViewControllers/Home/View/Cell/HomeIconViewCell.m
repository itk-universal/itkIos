//
//  HomeIconViewCell.m
//  PR
//
//  Created by 黄小雪 on 05/03/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "HomeIconViewCell.h"
#import "ItemView.h"

@interface HomeIconViewCell()
@property (strong,nonatomic) NSMutableArray *iconArray;

@end
@implementation HomeIconViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _iconArray = [NSMutableArray array];
        ItemView *itemview1 = [ItemView itemViewWithIconName:nil title:@"超市生鲜" subTitle:nil modelData:nil];
        [_iconArray addObject:itemview1];
    
        ItemView *itemview2 = [ItemView itemViewWithIconName:nil title:@"新鲜水果" subTitle:nil modelData:nil];
        [_iconArray addObject:itemview2];
        
        ItemView *itemview3 = [ItemView itemViewWithIconName:nil title:@"医药健康" subTitle:nil modelData:nil];
        [_iconArray addObject:itemview3];
        
        ItemView *itemview4 = [ItemView itemViewWithIconName:nil title:@"充值有礼" subTitle:nil modelData:nil];
        [_iconArray addObject:itemview4];
        
        ItemView *itemview5 = [ItemView itemViewWithIconName:nil title:@"邀请好友" subTitle:nil modelData:nil];
        [_iconArray addObject:itemview5];
        [self.contentView addSubview:itemview1];
        [self.contentView addSubview:itemview2];
        [self.contentView addSubview:itemview3];
        [self.contentView addSubview:itemview4];
        [self.contentView addSubview:itemview5];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if ([self.iconArray count]) {
        CGFloat kIconW  = 38;
        CGFloat kMargin =  ((float)self.width - kIconW*[self.iconArray count])/([self.iconArray count] + 1);
        NSInteger tempCount = 0;
        for (ItemView *item in self.iconArray) {
            tempCount ++;
            item.frame = CGRectMake(kMargin * tempCount,10,kIconW , self.height - 2*10);
        }
    }
    
    
}
@end
