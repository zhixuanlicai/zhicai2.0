//
//  SaveCachesFile.m
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "SaveCachesFile.h"

#define FolderName @"HTCaches"

@implementation SaveCachesFile

+ (id)loadDataList:(NSString *)fileName
{
    //  NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:CacheName];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0]stringByAppendingPathComponent:FolderName];
    NSFileManager *manager = [[NSFileManager alloc]init];
    if (![manager fileExistsAtPath:path])
    {
        NSError *error ;
        [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error)
        {
        }
    }
    
    NSString* fileDirectory = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.arc",fileName]];
    
    //解归档
    return [NSKeyedUnarchiver unarchiveObjectWithFile:fileDirectory];
}

+ (void)saveDataList:(id)object fileName:(NSString *)fileName
{
    //归档对象
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0]stringByAppendingPathComponent:FolderName];
    NSFileManager *manager = [[NSFileManager alloc]init];
    if (![manager fileExistsAtPath:path])
    {
        NSError *error ;
        [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error)
        {
            
        }
    }
    
    NSString* fileDirectory = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.arc",fileName]];
    
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:fileDirectory];
    
    if (success)
    {
        NSLog(@"归档成功");
    }
    
}


@end
