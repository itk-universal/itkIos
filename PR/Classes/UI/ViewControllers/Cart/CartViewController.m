//
//  CartViewController.m
//  PR
//
//  Created by 黄小雪 on 06/01/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//   购物车

#import "CartViewController.h"
#import "CartDataConstructor.h"

@interface CartViewController ()

@property (strong,nonatomic) CartDataConstructor *dataConstructor;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"购物车";
    [self constructData];
    [self.tableView reloadData];
}


- (void)constructData
{
    if (_dataConstructor == nil) {
        _dataConstructor          = [[CartDataConstructor alloc] init];
        //        _dataConstructor.delegate = self;
        //        _dataConstructor.responder = self;
    }
    [self.dataConstructor constructData];
    self.tableViewAdaptor.items = self.dataConstructor.items;
}


@end
