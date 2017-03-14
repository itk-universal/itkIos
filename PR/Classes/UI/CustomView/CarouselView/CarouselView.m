//
//  CarouselView.m
//  YHClouds
//
//  Created by 黄小雪 on 08/03/2017.
//  Copyright © 2017 YH. All rights reserved.
//

#import "CarouselView.h"
#import "CarouselItemView.h"

#define KTopMargin       10
#define kBaseTag         1000
#define kLeftMargin      25
@interface CarouselView()<UIScrollViewDelegate,CarouselItemViewDelegate>

@property (strong,nonatomic) UIScrollView   *scrollView;
@property (strong,nonatomic) NSMutableArray *inUseViews;
@property (strong,nonatomic) NSMutableArray *unUseViews;
@property (assign,nonatomic) NSInteger      maxVisibleIndex;
@property (assign,nonatomic) NSInteger      minVisibleIndex;
@property (strong,nonatomic) NSArray       *imageUrls;
@property (strong,nonatomic) NSArray       *titles;

@end

@implementation CarouselView
-(instancetype)init{
    if (self = [super init]) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        [self addSubview:_scrollView];
        
        _inUseViews = [NSMutableArray array];
        _unUseViews = [NSMutableArray array];
        
        _maxVisibleIndex = 0;
        _minVisibleIndex = 0;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.scrollView.contentSize = CGSizeMake([self.imageUrls count]*self.itemViewW + ([self.imageUrls count]+1)*kLeftMargin,self.height);
    self.scrollView.frame = self.bounds;
    for (CarouselItemView *itemView in self.scrollView.subviews) {
        if ([itemView isKindOfClass:[CarouselItemView class]]) {
            CGFloat kItemViewX = kLeftMargin*(itemView.tag - kBaseTag + 1) + self.itemViewW*(itemView.tag - kBaseTag);
            itemView.frame = CGRectMake(kItemViewX, KTopMargin,self.itemViewW, self.scrollView.height - 2*KTopMargin);
        }
    }
}

-(void)setImageUrl:(NSArray *)imageUrls titles:(NSArray *)titles
{
     CONDITION_CHECK_RETURN([imageUrls isKindOfClass:[NSArray class]] && [imageUrls count]);
    self.imageUrls = imageUrls;
    self.titles    = titles;
    
    if ([self.inUseViews count]) {
        [self.unUseViews addObjectsFromArray:self.inUseViews];
        [self.inUseViews removeAllObjects];
    }
    [self setUpScrollView];
    [self setNeedsLayout];
    [self performSelector:@selector(removeUnVisibleView) withObject:nil afterDelay:0];
}




#pragma mark scrollviewdelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.bounds.origin.x <= 0 ||
        scrollView.bounds.origin.x + scrollView.bounds.size.width>= scrollView.contentSize.width) {
        return;
    }
    if ((self.maxVisibleIndex == [self getMaxVisibleIndex] &&
         self.minVisibleIndex == [self getMinVisibleIndex]) ||
        [self getMaxVisibleIndex] > [self.imageUrls count] -1) {
        return;
    }
    [self removeUnVisibleView];
    self.minVisibleIndex = [self getMinVisibleIndex];
    self.maxVisibleIndex = [self getMaxVisibleIndex];
    
    for (NSInteger i = self.minVisibleIndex ; i <= self.maxVisibleIndex ;i ++) {
        [self addSubViewToScrollViewWithTag:i];
    }
}


-(NSInteger)viewMaxNum
{
    NSInteger kScrollViewW = ScreenWidth;
    NSInteger viewMaxNum   = 0;
    if (self.itemViewW && (kScrollViewW%self.itemViewW)) {
        viewMaxNum = kScrollViewW/self.itemViewW + 3;
    }else{
        viewMaxNum = kScrollViewW/self.itemViewW + 2;
    }
    if (viewMaxNum > [self.imageUrls count] ) {
        viewMaxNum = [self.imageUrls count];
    }
    return viewMaxNum;
}

-(void)setUpScrollView
{
    NSInteger viewMaxNum = [self viewMaxNum];
    for (NSInteger i = 0;  i < viewMaxNum; i++) {
        NSString *imageUrl   = [self.imageUrls safeObjectAtIndex:i];
        NSString *title      = nil;
        if (self.titles) {
            title = [self.titles safeObjectAtIndex:i];
        }
        if (imageUrl) {
            CarouselItemView *itemView = [self inUseViewWithTag:i + kBaseTag];
            if (itemView == nil) {
                itemView = [self getReuseView];
                if (itemView == nil) {
                    itemView     = [[CarouselItemView alloc]init];
                }
                itemView.tag = kBaseTag + i;
                itemView.delegate = self;
                [self.scrollView addSubview:itemView];
                [self.inUseViews addObject:itemView];
            }
            [itemView setImageUrl:imageUrl title:title index:i];
        }
    }
    
}


//移走不可见的View
-(void)removeUnVisibleView
{
    NSArray *tempArray = [NSArray arrayWithArray:self.inUseViews];
    for (CarouselItemView *subview in tempArray) {
        if ([subview isKindOfClass:[CarouselItemView class]]) {
            if (!CGRectIntersectsRect(self.scrollView.bounds,subview.frame) ) {
                [subview removeFromSuperview];
                [self.unUseViews addObject:subview];
                if ([self.inUseViews containsObject:subview]) {
                    [self.inUseViews removeObject:subview];
                }
            }
        }
    }
}


-(void)addSubViewToScrollViewWithTag:(NSInteger)tag
{
    if ([self inUseViewWithTag:tag] == nil){
        CarouselItemView *itemView = [self getReuseView];
        if (itemView) {
            itemView.tag   = tag + kBaseTag;
            CGFloat kItemViewX = kLeftMargin*(tag + 1) + self.itemViewW*tag;
            itemView.frame = CGRectMake(kItemViewX, KTopMargin,self.itemViewW, self.scrollView.height - 2*KTopMargin);
            [self.scrollView addSubview:itemView];
            [self upDateItemView:itemView index:tag];
            [self.inUseViews addObject:itemView];
        }
    }
}

-(void)upDateItemView:(CarouselItemView *)itemView index:(NSInteger)index
{
    NSString *imageUrl   = [self.imageUrls safeObjectAtIndex:index];
    NSString *title      = nil;
    if (self.titles) {
        title = [self.titles safeObjectAtIndex:index];
    }
    [itemView setImageUrl:imageUrl title:title index:index];
}
//当前可见view的最小的tag
-(NSInteger)getMinVisibleIndex
{
    NSInteger tempIndex = 0;
    NSInteger tempX = self.scrollView.bounds.origin.x - 1;
    if (tempX%(self.itemViewW + kLeftMargin)) {
        tempIndex = tempX/(self.itemViewW + kLeftMargin);
    }else{
         tempIndex = tempX/(self.itemViewW + kLeftMargin) - 1;
    }
    if (tempIndex < 0) {
        tempIndex = 0;
    }
    return tempIndex;
    
}

//当前可见的view的最大的tag
-(NSInteger)getMaxVisibleIndex
{
    NSInteger tempIndex = 0;
    NSInteger tempX = self.scrollView.bounds.origin.x + 1 +
    self.scrollView.bounds.size.width;
    if (tempX%(self.itemViewW + kLeftMargin)) {
        tempIndex = tempX/(self.itemViewW + kLeftMargin);
    }else{
         tempIndex = tempX/(self.itemViewW + kLeftMargin) - 1;
    }
    if (tempIndex > [self.imageUrls count] - 1) {
        tempIndex = [self.imageUrls count] -1;
    }
    return tempIndex;
}


-(CarouselItemView *)inUseViewWithTag:(NSInteger)tag
{
    for (CarouselItemView *itemView in self.inUseViews) {
        if (itemView.tag == tag + kBaseTag) {
            return itemView;
        }
    }
    return nil;
}

//获取复用的view
-(CarouselItemView *)getReuseView
{
    CarouselItemView *reuseView = nil;
    if ([self.unUseViews count]) {
        reuseView = [self.unUseViews objectAtIndex:0];
        [self.unUseViews removeObject:reuseView];
    }
    if ([reuseView isKindOfClass:[CarouselItemView class]]) {
        return reuseView;
    }
    return nil;
}

#pragma mark CarouselItemViewDelegate
-(void)carouselItemViewDidSeleted:(CarouselItemView *)itemView
{
    PRLOG(@"点击了CarouselItemView的第%zd个",itemView.index);
}

@end
