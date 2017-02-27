//
//  WTTabBarViewController.m
//  PR
//
//  Created by 黄小雪 on 16/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "WTTabBarViewController.h"
#import "PRTabbarItem.h"
#import "PRControlCenter.h"
#import "PRTabbarView.h"
#import "WTTabbarNotifyInterface.h"

@interface WTTabBarViewController() <UITabBarControllerDelegate>

@property (strong,nonatomic) PRTabbarView *tabbarView;

@end

@implementation WTTabBarViewController

-(instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    NSArray * selectedTabImgArr = @[@"tabbar_one_selected", @"tabbar_two_selected", @"tabbar_three_selected", @"tabbar_four_selected"];
    NSArray * unSelectedTabImgArr = @[@"tabbar_one_unselected", @"tabbar_two_unselected", @"tabbar_three_unselected", @"tabbar_four_unselected"];
    NSDictionary * tabImgDic = @{@"selected": selectedTabImgArr, @"unSelected": unSelectedTabImgArr};
    self.tabbarView = [[PRTabbarView alloc] initWithSelectedImgDic:tabImgDic];
    self.tabbarView.tag = 500001;
    [self.tabBar addSubview:self.tabbarView];
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    [self.tabbarView setSelectedIndex:selectedIndex];
}

#pragma mark - UITabBarDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([self.tabbarView curSeletedIndex] == item.tag) {
        UIViewController *topSeriesVC = [self.viewControllers safeObjectAtIndex:item.tag];
        if ([topSeriesVC conformsToProtocol:@protocol(WTTabbarNotifyInterface)]) {
            __weak id<WTTabbarNotifyInterface> theVC = (id)topSeriesVC;
            if ([theVC respondsToSelector:@selector(refreshActionTriggerByTabbar)]) {
                [theVC refreshActionTriggerByTabbar];
            }
        }
    }
    [self.tabbarView setSelectedIndex:item.tag];
}

//修改tabbar的显示名字
-(void)alterTabBarName:(NSString *)name index:(NSInteger)index{
//    [self.tabbarView alterTabBarName:name index:index];
}


@end
