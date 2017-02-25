//
//  WTTableViewCell.m
//  PR
//
//  Created by 黄小雪 on 18/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "WTTableViewCell.h"

@implementation WTTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}
- (void)setObject:(id)object
{
    _object = object;
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object
{
    return 45.0;
}

@end
