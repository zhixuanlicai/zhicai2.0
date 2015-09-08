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
+(UILabel*)createFontNameLabel:(NSString*)text FontName:(NSString *)name Size:(int)size TextColor:(UIColor*)textColor Rect:(CGRect)rect Align:(NSTextAlignment)align;
+(UIImageView *)creatImgeViewRect:(CGRect)rect Color:(UIColor *)color Img:(NSString *)image alpha:(CGFloat)alpha;
#pragma mark 创建textField
+(UITextField*)createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                           leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName font:(float)font;
//资产格式
+ (NSString *)numFormatMoney:(CGFloat)money numberStyle:(NSNumberFormatterStyle)style;
+(UIButton*)createButtonFrame:(CGRect)frame Title:(NSString*)title TitleColor:(UIColor *)color font:(CGFloat)font BgColor:(UIColor *)bgColor BgImageName:(NSString*)bgImageName ImageName:(NSString*)imageName  SeleImage:(NSString *)sImage Method:(SEL)sel target:(id)target;
//导航栏右侧按钮
+ (UIBarButtonItem *)customBarButtonItemTarget:(id)target width:(CGFloat)width height:(CGFloat)height action:(SEL)action string:(NSString *)string color:(UIColor *)color ImageName:(NSString *)image;
//验证身份证是否合法
+(BOOL)checkIdentityCardNo:(NSString *)cardNo;
//交易记录通用
+ (UIView *)creatCellView:(NSString *)name rightTxt:(NSString *)text top:(CGFloat)top;

//返回按钮
+ (UIBarButtonItem *)backBarButtonItemTarget:(id)target action:(SEL)action;

+ (UIBarButtonItem *)customBarButtonItemTarget:(id)target action:(SEL)action string:(NSString *)string;

@end
