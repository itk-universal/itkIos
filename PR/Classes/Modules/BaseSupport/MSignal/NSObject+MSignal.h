//
//  NSObject+MSignal.h
//  PR
//
//  Created by 黄小雪 on 24/02/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSignalInterface <NSObject>
@optional
-(void)handleSignal:(ns)

@end
@interface NSObject (MSignal)

@end
