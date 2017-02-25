//
//  FileManager.m
//  PR
//
//  Created by 黄小雪 on 13/01/2017.
//  Copyright © 2017 黄小雪. All rights reserved.
//

#import "FileManager.h"

NSString * const FMPart_User = @"fmUser";
NSString * const FMPart_ObjCache = @"fmCache";
NSString * const FMPart_GeneralConfig = @"fmConfig";
NSString * const FMPart_Patch = @"fmpatch";

@implementation FileManager
IMP_SINGLETON
+(FileManager *)shareManager
{
    static FileManager *theFileManager = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        theFileManager = [[FileManager alloc]init];
    });
    
    return theFileManager;
}

#warning type????
-(NSString *)baseFilePathForType:(FMTYPE)type
{
//    switch (type) {
//        case FM_UserDataByShare:
//        {
//            NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//            NSString *documentsDirectory = [paths1 objectAtIndex:0];
//            return documentsDirectory;
//        }
//        case FM_AppFileByCache:
//        {
//            
//            
//        }
//
//            
//        default:
//            break;
//    }
    return nil;
}

@end
