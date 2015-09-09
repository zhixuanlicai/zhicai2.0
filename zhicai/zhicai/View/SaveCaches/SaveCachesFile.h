//
//  SaveCachesFile.h
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveCachesFile : NSObject


/**
 *  解归档
 *
 *  @param fileName 文件名
 *
 *  @return 解完归档后的数据
 */
+ (id)loadDataList:(NSString *)fileName;

/**
 *  归档
 *
 *  @param object   归档的数据
 *  @param fileName 文件名
 */
+ (void)saveDataList:(id)object fileName:(NSString *)fileName;

@end
