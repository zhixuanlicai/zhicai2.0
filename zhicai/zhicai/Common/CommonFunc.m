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


+(UILabel*)createFontNameLabel:(NSString*)text FontName:(NSString *)name Size:(int)size TextColor:(UIColor*)textColor Rect:(CGRect)rect Align:(NSTextAlignment)align ifBool:(BOOL)ifBool
{
    UILabel* label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = textColor;
    //    label.font = [UIFont systemFontOfSize:size];
    label.font = [UIFont fontWithName:name size:size];
    if (ifBool)
    {
        //高度固定不折行，根据字的多少计算label的宽度
        CGSize sizef = [text sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, label.frame.size.height)];
        NSLog(@"size.width=%f, size.height=%f", sizef.width, sizef.height);
        //根据计算结果重新设置UILabel的尺寸
        label.width = sizef.width;
    }
  
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

+(UIButton*)createButtonFrame:(CGRect)frame Title:(NSString*)title TitleColor:(UIColor *)color font:(CGFloat)font BgColor:(UIColor *)bgColor BgImageName:(NSString*)bgImageName ImageName:(NSString*)imageName  SeleImage:(NSString *)sImage Method:(SEL)sel target:(id)target
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundColor:bgColor];
    [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:sImage] forState:UIControlStateSelected];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIBarButtonItem *)customBarButtonItemTarget:(id)target width:(CGFloat)width height:(CGFloat)height action:(SEL)action string:(NSString *)string color:(UIColor *)color ImageName:(NSString *)image
{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 35)];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, width, height);
    button.backgroundColor = color;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    CGSize size = [string sizeWithFont:[UIFont systemFontOfSize:17]];
//    if(size.width > view.width)
//    {
//        button.titleLabel.font = [UIFont systemFontOfSize:15];
//        button.titleLabel.textAlignment = NSTextAlignmentLeft;
//        button.frame=CGRectMake(-10, 12, string.length * 15, 15);
//    }
//    else
//    {
//        button.titleLabel.font = [UIFont systemFontOfSize:17];
//        button.titleLabel.textAlignment = NSTextAlignmentCenter;
//        button.frame=CGRectMake(0, 12, string.length * 17 + 10, 17);
//    }
    
    button.titleLabel.textColor = color;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:string forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:button];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+(BOOL)checkIdentityCardNo:(NSString *)cardNo
{
    if (cardNo.length != 18)
    {
        return NO;
    }
    NSArray *codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary *checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil] forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner *scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] &&[scan isAtEnd];
    if (!isNum)
    {
        return NO;
    }
    
    int sumValue = 0;
    for (int i = 0; i < 17; i ++)
    {
        sumValue += [[cardNo substringWithRange:NSMakeRange(i, 1)]intValue] *[[codeArray objectAtIndex:i]intValue];
    }
    
    NSString *strlast =[checkCodeDic objectForKey:[NSString stringWithFormat:@"%@",@(sumValue % 11)]];//:[NSString stringWithFormat:@"%d",sumValue % 11]
    
    if ([strlast isEqualToString:[[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]])
    {
        return YES;
    }
    
    return NO;
}


+ (UIView *)creatCellView:(NSString *)name rightTxt:(NSString *)text top:(CGFloat)top
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, top, mScreenWidth, 44)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLab = [CommonFunc createLabel:name FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 11, 150, 20) Align:NSTextAlignmentLeft];
    [view addSubview:nameLab];
    
    UILabel *rightLabel = [CommonFunc createLabel:text FontSize:12 TextColor:[UIColor colorWithHexString:@"878787"] Rect:CGRectMake(view.width - 161, 15, 150, 14) Align:NSTextAlignmentRight];
    [view addSubview:rightLabel];
    
    UIImageView *linIMG = [CommonFunc creatImgeViewRect:CGRectMake(3, 43, view.width - 6, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.5];
    [view addSubview:linIMG];
    
    return view;
}

+ (UIBarButtonItem *)backBarButtonItemTarget:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"sdhsjhds"] forState:UIControlStateNormal];
    button.frame=CGRectMake(0, 0, 30, 21);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)customBarButtonItemTarget:(id)target action:(SEL)action string:(NSString *)string
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame=CGRectMake(0, 0, 60, 20);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button setTitle:string forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
