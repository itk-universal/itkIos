//
//  FPCycleScrollView.h
//  PR
//
//  Created by 黄小雪 on 16/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SDCycleScrollViewPageContolAliment)
{
    SDCycleScrollViewPageContolAlimentRight,
    SDCycleScrollViewPageContolAlimentCenter
};

typedef NS_ENUM(NSInteger,SDCycleScrollViewPageContolStyle)
{
    SDCycleScrollViewPageContolStyleClassic,        // 系统自带经典样式
    SDCycleScrollViewPageContolStyleAnimated,       // 动画效果pagecontrol
    SDCycleScrollViewPageContolStyleNone   ,        // 不显示pagecontrol
    SDCycleScrollViewPageContolStyleNumber
};

typedef NS_ENUM(NSInteger,SDEmbedViewType)
{
    SDEmbedViewUnknown,
    SDEmbedViewHome,
    SDEmbedViewGoodsDetail,
};

typedef NS_ENUM(NSInteger,SDCycleScrollviewDotPosition)
{
    SDCycleScrollviewDotPositionLeft,           // ...在左边
    SDCycleScrollviewDotPositionMiddle,         // ...在中间 缺省值
    SDCycleScrollviewDotPositionRight           // ...在右边
};

@class FPCycleScrollView;

@protocol SDCycleScrollViewDelegate <NSObject>

- (void)cycleScrollView:(FPCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

@end
@interface FPCycleScrollView : UIView

// >>>>>>>>>>>>>>>>>>>>>>>>>>  数据源接口

// 本地图片数组
@property (strong,nonatomic) NSArray *localizationImagesGroup;
// 网络图片 url string数组
@property (strong,nonatomic) NSArray *imageURLStringsGroup;
// 每张图片对应要显示的文字数组
@property (strong,nonatomic) NSArray *titlesGroup;


// >>>>>>>>>>>>>>>>>>>>>>>>>  滚动控制接口

//自动滚动间隔时间，默认2s
@property (assign,nonatomic) CGFloat autoScrollTimeInterval;
// 是否无限循环，默认YES
@property (assign,nonatomic)  BOOL  infiniteLoop;
//是否自动滚动，默认YES
@property (assign,nonatomic)  BOOL  autoScroll;

@property (weak,nonatomic)    id<SDCycleScrollViewDelegate> delegate;


// >>>>>>>>>>>>>>>>>>>>>>>>>  自定义样式接口

// 是否显示分页控件
@property (assign,nonatomic) BOOL showPageControl;
// 是否在只有一张图时隐藏pagecontrol,默认YES
@property (assign,nonatomic) BOOL hidesForSinglePage;
// pagecontrol样式，默认为动画样式
@property (assign,nonatomic)  SDCycleScrollViewPageContolStyle pageControlStyle;
//占位图，用于网络未加载到图片时
@property (strong,nonatomic)  UIImage *placeholderImage;
// 分页控件位置
@property (nonatomic, assign) SDCycleScrollViewPageContolAliment pageControlAliment;
//分页控件小圆标大小
@property (assign,nonatomic)  CGSize pageControlDotSize;
//分页控件小图标颜色
@property (strong,nonatomic)  UIColor *dotColor;
// 分页控件小圆位于底部位置
@property (nonatomic, assign) SDCycleScrollviewDotPosition dotPosition;

@property (strong,nonatomic) UIColor *titleLabelTextColor;
@property (strong,nonatomic) UIFont  *titleLabelTextFont;
@property (strong,nonatomic) UIColor *titleLabelBackgroundColor;
@property (assign,nonatomic) CGFloat titleLabelHeight;


// >>>>>>>>>>>>>>>>>>>>>>>>>  BI info
@property (nonatomic,assign) SDEmbedViewType embedViewType;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageURLStringsGroup:(NSArray *)imageURLStringsGroup;

//获取当前展现的图片index
-(NSInteger)currentViewIndex;
- (UIImage *)currentShownImage;

//替换pagecontrol的小圆点的图片
-(void)setDotImageName:(NSString *)dotImageName currentDotImageName:(NSString *)currentDotImageName;

@end
