//
//  CDetalsViewController.m
//  zhicai
//
//  Created by D on 15/9/9.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "CDetalsViewController.h"
#import "StateViewController.h"

@interface CDetalsViewController ()
{
    UIView *choView;
}

@end

@implementation CDetalsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"智选天下1期";
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self addSubViews];
    
    [self addSentButton];
 }

- (void)addSubViews
{
   //预计显示收益时间
    UILabel *tLab = [CommonFunc createLabel:@"预计显示收益时间: 2015-03-06" FontSize:11 TextColor:[UIColor colorWithHexString:@"08A9FC"] Rect:CGRectMake(16, 0,mScreenWidth - 32 , 20) Align:NSTextAlignmentLeft];
    [self.view addSubview:tLab];
    
    //可购买金额
    UIView *viewO = [self listView:CGRectMake(0, tLab.bottom, mScreenWidth, 44) color:[UIColor whiteColor] name:@"购买金额" line:.5 yesOrNo:NO];
    
    UILabel *yOLab = [CommonFunc createLabel:@"" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(mScreenWidth - 27, (viewO.height - 20)/2, /*16*/0, 20) Align:NSTextAlignmentLeft];
    [viewO addSubview:yOLab];
    
     NSString *str = [CommonFunc  numFormatMoney:500000 numberStyle:NSNumberFormatterCurrencyStyle];
    NSString *numStr = [str  substringWithRange:NSMakeRange(0,[str length] - 3)];
    
    UILabel *oLab = [CommonFunc createLabel:[NSString stringWithFormat:@"%@元  可供购买",numStr] FontSize:15 TextColor:[UIColor lightGrayColor] Rect:CGRectMake(121, (viewO.height - 20)/2, mScreenWidth - 132 - yOLab.width - 11  , 20) Align:NSTextAlignmentRight];
    [viewO addSubview:oLab];
    
    [self.view addSubview:viewO];
    
    //预计收益余额
    UIView *viewT = [self listView:CGRectMake(0, viewO.bottom, mScreenWidth, 45) color:[UIColor clearColor] name:@"预计收益金额：" line:.2 yesOrNo:NO];
    
    UILabel *yLab = [CommonFunc createLabel:@"元" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(mScreenWidth - 27, (viewT.height - 20)/2, 16, 20) Align:NSTextAlignmentLeft];
    [viewT addSubview:yLab];
    
    //收益金额
    UILabel *sMLab = [CommonFunc createLabel:@"30" FontSize:15 TextColor:[UIColor colorWithHexString:@"265BFF"] Rect:CGRectMake(121, yLab.top, mScreenWidth - 132 - yLab.width - 11 , 20) Align:NSTextAlignmentRight];
    [viewT addSubview:sMLab];
    
    [self.view addSubview:viewT];
    
    //代金券和银行卡
    choView = [[UIView alloc]initWithFrame:CGRectMake(0, viewT.bottom, mScreenWidth, 88)];
    choView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    choView.layer.borderWidth = .3;
    [self.view addSubview:choView];
    
    //代金券选择
    UIView *viewTh = [self listView:CGRectMake(0,0, mScreenWidth, 44) color:[UIColor whiteColor] name:@"代金券" line:.7 yesOrNo:YES];
    [choView addSubview:viewTh];
    
    UILabel *dLab = [CommonFunc createLabel:@"（未使用）" FontSize:15 TextColor:[UIColor lightGrayColor] Rect:CGRectMake(121, (viewTh.height - 20) / 2, viewTh.width - 121 - 27, 20) Align:NSTextAlignmentRight];
    [viewTh addSubview:dLab];
    
    //银行卡选择
    UIView *viewF = [self listView:CGRectMake(0, viewTh.bottom, mScreenWidth, 44) color:[UIColor whiteColor] name:@"银行卡" line:.7 yesOrNo:YES];
    [choView addSubview:viewF];
    
    UILabel *fLab = [CommonFunc createLabel:@"（未绑定）" FontSize:15 TextColor:[UIColor lightGrayColor] Rect:CGRectMake(121, (viewF.height - 20) / 2, viewF.width - 121 - 27, 20) Align:NSTextAlignmentRight];
    [viewF addSubview:fLab];
    
    //同意协议勾选视图
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0, choView.bottom + 19, mScreenWidth, 20)];
    [self.view addSubview:aView];
    
    UIImageView *bottomIMG = [CommonFunc creatImgeViewRect:CGRectMake((mScreenWidth - 288)/2, aView.bottom + 44, 288, 98) Color:nil Img:@"iconghbg" alpha:1];
    [self.view addSubview:bottomIMG];
    
}

- (UIView *)listView:(CGRect)rect color:(UIColor *)color name:(NSString *)name line:(CGFloat)linWidth yesOrNo:(BOOL)isIBool
{
    UIView *lisView = [[UIView alloc]initWithFrame:rect];
    lisView.backgroundColor = color;
    lisView.layer.borderWidth = linWidth;
    lisView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UILabel *naLab = [CommonFunc createLabel:name FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11,(lisView.height - 20)/2 , 110, 20) Align:NSTextAlignmentLeft];
    [lisView addSubview:naLab];
    
    UIImageView *rightIMG = [CommonFunc creatImgeViewRect:CGRectMake(mScreenWidth - 22, (lisView.height - 17)/2, 11, 17) Color:nil Img:@"dsfcsdxz" alpha:1];
    if (isIBool)
    {
        [lisView addSubview:rightIMG];
    }
    
    return lisView;
}

//提交
- (void)addSentButton
{
    UIButton *sentBtn = [CommonFunc createButtonFrame:CGRectMake(0, mScreenHeight - 49 - mStatusBarOffset, mScreenWidth, 49) Title:@"提交" TitleColor:[UIColor whiteColor] font:20 BgColor:[UIColor colorWithHexString:@"DADCE9"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(stateContrlAction:) target:self];
    [self.view addSubview:sentBtn];
}

- (void)stateContrlAction:(UIButton *)sender
{
    StateViewController * stateVC = [[StateViewController alloc]init];
    [self.navigationController pushViewController:stateVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
