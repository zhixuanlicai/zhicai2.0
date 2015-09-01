//
//  commfunc.h
//  zhicai
//
//  Created by 陈思思 on 15/7/24.
//  Copyright (c) 2015年 perfect. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonFunc : NSObject
//+ (void)showCustInfo:(NSString*)title MessageString:(NSString*)message;
+ (NSDate*)stringToDate:(NSString*) str;
+ (NSString*) dateToString:(NSDate*)date;
+ (NSString *)md5HexDigest:(NSString*)input ;
+(UILabel*) createLabel:(NSString*)text FontSize:(int)size TextColor:(UIColor*)textColor Rect:(CGRect)rect Align:(NSTextAlignment)align;
@end
