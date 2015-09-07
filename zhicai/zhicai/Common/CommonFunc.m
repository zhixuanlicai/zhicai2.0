//
//  commfunc.m
//  zhicai
//
//  Created by 陈思思 on 15/7/24.
//  Copyright (c) 2015年 perfect. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import "CommonFunc.h"

@implementation CommonFunc : NSObject 
//+ (void)showCustInfo:(NSString*)title MessageString:(NSString*)message
//{
//    //empty
//    if (message == nil || message.length == 0) {
//        return;
//    }
//    
//    //found html tag and other unexpected message
//    if ([message.lowercaseString rangeOfString:@"<html"].location != NSNotFound ||
//        [message.lowercaseString rangeOfString:@"an error has occurred"].location != NSNotFound)
//    {
//        message = @"服务器错误发生，我们正在解决中";
//    }
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
//    [alert show];
//}

+ (NSDate*)stringToDate:(NSString*) str{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    return [inputFormatter dateFromString:str];
}

+ (NSString*) dateToString:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"yyyy-MM-dd"];
    return [formatter stringFromDate:date];
}

+(UILabel*) createLabel:(NSString*)text FontSize:(int)size TextColor:(UIColor*)textColor Rect:(CGRect)rect Align:(NSTextAlignment)align
{
    UILabel* label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:size];
    label.textAlignment = align;
    label.text = text;
    return label;
}



+ (NSString *)md5HexDigest:(NSString*)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%2s",result];
    }
    return ret;
}


+(UILabel*)createFontNameLabel:(NSString*)text FontName:(NSString *)name Size:(int)size TextColor:(UIColor*)textColor Rect:(CGRect)rect Align:(NSTextAlignment)align
{
    UILabel* label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = textColor;
    //    label.font = [UIFont systemFontOfSize:size];
    label.font = [UIFont fontWithName:name size:size];
    label.textAlignment = align;
    label.text = text;
    return label;
}

+(UIImageView *)creatImgeViewRect:(CGRect)rect Color:(UIColor *)color Img:(NSString *)image alpha:(CGFloat)alpha
{
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:rect];
    imgView.backgroundColor = color;
    imgView.image = [UIImage imageNamed:image];
    imgView.alpha = alpha;
    return imgView;
}


+ (NSString *)numFormatMoney:(CGFloat)money numberStyle:(NSNumberFormatterStyle)style
{
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc]init];
    [numFormat setNumberStyle:style];//分隔符和小数点都存在
    NSNumber *num = [NSNumber numberWithDouble:money];
    NSString *numStr = [numFormat stringFromNumber:num];
    return  [numStr substringWithRange:NSMakeRange(1,[numStr length] - 1)];//去掉第一个标识符
}


//适配器模式，在原有方法上进行扩展出一个方法，适用于版本迭代更新，其中增加一些方法属性，由于原有方法需要适配旧版本，所以在基础上，进行扩展
+(UITextField*)createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                           leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName font:(float)font{
    //通过原有方法进行创建，然后再进行相对的补充
    UITextField*textField=[CommonFunc createTextFieldFrame:frame Placeholder:placeholder leftView:leftView rightView:rightView BgImageName:bgImageName];
    textField.font=[UIFont systemFontOfSize:font];
    return textField;
    
    
}

+(UITextField*)createTextFieldFrame:(CGRect)frame Placeholder:(NSString*)placeholder
                           leftView:(UIView*)leftView rightView:(UIView*)rightView BgImageName:(NSString*)bgImageName
{
    UITextField*textField=[[UITextField alloc]initWithFrame:frame];
    textField.placeholder=placeholder;
    //左边图像
    textField.leftViewMode=UITextFieldViewModeAlways;
    textField.leftView=leftView;
    //右边图像
    textField.rightViewMode=UITextFieldViewModeAlways;
    textField.rightView=rightView;
    if (bgImageName) {
        [textField setBackground:[UIImage imageNamed:bgImageName]];
    }
    
    return textField;
}

@end
