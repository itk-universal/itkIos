//
//  HomeIconViewCell.m
//  PR
//
//  Created by 黄小雪 on 05/03/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "HomeIconViewCell.h"
//#import "ItemView.h"
#import "SingleIconView.h"
#import "DMExhibitItem.h"
#import "DynamicUIModel.h"
#import "SingleIconView.h"

@interface HomeIconViewCell()
@property (strong,nonatomic) NSMutableArray *iconArray;

@end
@implementation HomeIconViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _iconArray = [NSMutableArray array];
        [self.contentView setBackgroundColor:[UIColor orangeColor]];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if ([self.iconArray count]) {
        CGFloat kMargin = 15;
        CGFloat kIconW  = (self.width - ([self.iconArray count] + 1)*kMargin)*1.0/[self.iconArray count];
        NSInteger tempCount = 0;
        for (SingleIconView *item in self.iconArray) {
            item.frame = CGRectMake((tempCount+1) * kMargin + tempCount * kIconW,10,kIconW , self.height - 2*10);
            tempCount ++;
        }
    }
}

-(void)setObject:(id)object{
    CONDITION_CHECK_RETURN([object isKindOfClass:[DynamicCardItem class]]);
    DynamicCardItem *item = (DynamicCardItem *)object;
    NSArray *tempArray = item.data;
    for (DMExhibitItem *info in tempArray) {
        SingleIconView *iconView = [[SingleIconView alloc]init];
        [iconView setItem:info];
        [self.contentView addSubview:iconView];
        [self.iconArray addObject:iconView];
    }
    [self setNeedsLayout];
}

+(CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object
{
    return 85;
}
@end
