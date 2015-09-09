//
//  ListDetailsController.m
//  zhicai
//
//  Created by D on 15/9/9.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "ListDetailsController.h"
#import "CDetalsViewController.h"
#import "SafeViewController.h"
#import "ProIntroViewController.h"

@interface ListDetailsController ()<UITextFieldDelegate>
{
    UIView *showView;
}

@property (nonatomic, strong)UIView *txtView;

@property (nonatomic, strong) UIView *listView;

@property (nonatomic, strong) UITextField *addNum;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIView *ShowContrl;

@property (nonatomic, strong)  UILabel *sMLab;//收益钱数

@end

@implementation ListDetailsController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"智选天下一期";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self.view addSubview:[self tableHeadView]];
    
    [self bottomSubViews];
    
    [self addButton];
    
 }

 -(UIView *)tableHeadView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 182)];
    view.backgroundColor = [UIColor clearColor];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 172)];
    topView.backgroundColor = [UIColor whiteColor];
    
    //年化收益
    UILabel *yLab = [CommonFunc createLabel:@"预期年化收益" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11,29,100,20) Align:NSTextAlignmentLeft];
    [topView addSubview:yLab];
    
    //高度固定不折行，根据字的多少计算label的宽度
    NSString *str = @"12.00";
    UILabel *nLab = [CommonFunc createFontNameLabel:str FontName:@"Helvetica"  Size:53 TextColor:[UIColor colorWithHexString:@"007FFC"] Rect:CGRectMake(11, yLab.bottom + 5, 20, 60) Align:NSTextAlignmentLeft ifBool:YES];
    [topView addSubview:nLab];
    
    UILabel *bLab = [CommonFunc createLabel:@"%" FontSize:14 TextColor:[UIColor colorWithHexString:@"007FFC"] Rect:CGRectMake(nLab.right,yLab.bottom + 35,100,20) Align:NSTextAlignmentLeft];
    [topView addSubview:bLab];
    
     //起投金额
    UILabel *sLab = [CommonFunc createLabel:@"起投金额：100元" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(mScreenWidth - 150,yLab.top,145,25) Align:NSTextAlignmentLeft];
    [topView addSubview:sLab];
    
    //投资期限
    UILabel *tLab = [CommonFunc createLabel:@"投资期限：30天" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(mScreenWidth - 150,sLab.bottom,145,25) Align:NSTextAlignmentLeft];
    [topView addSubview:tLab];
    
    //已投人数
    UILabel *rLab = [CommonFunc createLabel:@"已投人数：50人" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(mScreenWidth - 150,tLab.bottom,145,25) Align:NSTextAlignmentLeft];
    [topView addSubview:rLab];
    
    //剩余可投
    UILabel *cLab = [CommonFunc createLabel:@"剩余可投：100万元" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(mScreenWidth - 150,rLab.bottom,145,25) Align:NSTextAlignmentLeft];
    [topView addSubview:cLab];
    
    [view addSubview:topView];

    return view;
}

- (void)bottomSubViews
{
    UIView *boView = [[UIView alloc]initWithFrame:CGRectMake(0, 182, mScreenWidth, 192)];
    boView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:boView];
    
    self.listView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 150)];
    [boView addSubview:self.listView];
    
    UIView *lisO = [self listViewRect:CGRectMake(0, 0, mScreenWidth, 50) Name:@"项目介绍" LeftIMG:@"sgdfdn" RightIMG:@"dsfcsdxz"];
    [self.listView addSubview:lisO];
    
    UIView *lisT = [self listViewRect:CGRectMake(0, 50, mScreenWidth, 50) Name:@"关于供应商" LeftIMG:@"skjdjcdn" RightIMG:@"dsfcsdxz"];
    [self.listView addSubview:lisT];
    
    UIView *lisS = [self listViewRect:CGRectMake(0, 100, mScreenWidth, 50) Name:@"资产安全体系" LeftIMG:@"skdsvn" RightIMG:@"dsfcsdxz"];
    [self.listView addSubview:lisS];
    
    
    UIView *safeView = [[UIView alloc]initWithFrame:CGRectMake((mScreenWidth - 222)/2, self.listView.bottom + 21, 222, 21)];
    safeView.backgroundColor = [UIColor clearColor];
    
    UIImageView *safeIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 0, 18, 21) Color:nil Img:@"fvfdxg" alpha:1];
    [safeView addSubview:safeIMG];
    
    UILabel *label = [CommonFunc createFontNameLabel:@"账户资金安全由智选理财100%承保" FontName:@"Helvetica-Bold" Size:12 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(safeIMG.right + 5, 0, 195, 21) Align:NSTextAlignmentLeft ifBool:YES];
    [safeView addSubview:label];
    
    [boView addSubview:safeView];
    
    [self.view addSubview:boView];
    
    UIImageView *boIMG = [CommonFunc creatImgeViewRect:CGRectMake((mScreenWidth - 288)/2, boView.bottom + 44, 288, 98) Color:nil Img:@"iconghbg" alpha:1];
    [self.view addSubview:boIMG];
}

- (UIView *)listViewRect:(CGRect)rect Name:(NSString *)name LeftIMG:(NSString *)lefImg RightIMG:(NSString *)rightImg
{
    UIView *view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(11, (view.height - 33)/2, 32, 32) Color:nil Img:lefImg alpha:1];
    [view addSubview:leftIMG];
    
    UILabel *nLab = [CommonFunc createLabel:name FontSize:16 TextColor:[UIColor colorWithString:@"4C595D"] Rect:CGRectMake(leftIMG.right + 11, (view.height - 21) / 2, 100, 20) Align:NSTextAlignmentLeft];
    [view addSubview:nLab];
    //@"dsfcsdxz"
    UIImageView *rightIMG = [CommonFunc creatImgeViewRect:CGRectMake(view.width - 22, (view.height - 18)/2, 11, 17) Color:nil Img:rightImg alpha:1];
    [view addSubview:rightIMG];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, view.height - 1, mScreenWidth, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.2];
    [view addSubview:lineIMG];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(nextControlAction:)];
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:tap];
    
    return view;
}

- (void)nextControlAction:(UITapGestureRecognizer *)gesture
{
    NSInteger index = [self.listView.subviews indexOfObject:gesture.view];
    NSLog(@"indexx  %@",@(index));
    switch (index)
    {
        case 0:
        {
            ProIntroViewController *introVC = [[ProIntroViewController alloc]init];
            [self.navigationController pushViewController:introVC animated:YES];
        }
            break;
        case 2:
        {
            SafeViewController *safeVC = [[SafeViewController alloc]init];
            [self.navigationController pushViewController:safeVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

//添加底部按钮
- (void)addButton
{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight - 49 - mStatusBarOffset, mScreenWidth, 49)];
    
    UIButton *leftBtn = [CommonFunc createButtonFrame:CGRectMake(0, 0, 50, 50) Title:nil TitleColor:nil font:0 BgColor:nil BgImageName:nil ImageName:@"fghbgvb" SeleImage:nil Method:@selector(showMoView:) target:self];
    [ self.bottomView addSubview:leftBtn];
    
    UIButton *botton = [CommonFunc createButtonFrame:CGRectMake(leftBtn.right,0, mScreenWidth - 50, 49) Title:@"开始赚钱" TitleColor:[UIColor whiteColor] font:20 BgColor:[UIColor colorWithHexString:@"0064DD"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(showMoView:) target:self];
    [self.bottomView addSubview:botton];
    
    
    [self.view addSubview:self.bottomView];
}

- (void)showMoView:(UIButton *)sender
{
    NSInteger index = [self.bottomView.subviews indexOfObject:sender];
    switch (index)
    {
        case 0:
        {
            [self addShowView];
            self.bottomView.hidden = YES;
        }
            break;
        case 1:
        {
            CDetalsViewController *detaVC = [[CDetalsViewController alloc]init];
            [self.navigationController pushViewController:detaVC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)addShowView
{
    showView = [[UIView alloc]initWithFrame:APPDelegate.window.bounds];
    showView.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyHide)];
    showView.userInteractionEnabled = YES;
    [showView addGestureRecognizer:tap];
    
    UIImageView *bgIMG = [[UIImageView alloc]initWithFrame:showView.bounds];
    bgIMG.backgroundColor = [UIColor blackColor];
    bgIMG.alpha = .3;
    [showView addSubview:bgIMG];
    
    [APPDelegate.window addSubview:showView];
    
    self.txtView = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight, mScreenWidth, 413)];
    self.txtView.backgroundColor = [UIColor  whiteColor];
    [showView addSubview:self.txtView];

    [UIView animateWithDuration:.2 animations:^{
        self.txtView.top  = mScreenHeight - 413;
    } completion:^(BOOL finished) {
        
    }];
  
    
     self.ShowContrl= [[UIView alloc]initWithFrame:CGRectMake(0,0, mScreenWidth, 49)];
    
    UIButton *leftBtn = [CommonFunc createButtonFrame:CGRectMake(0, 0, 50, 50) Title:nil TitleColor:nil font:0 BgColor:nil BgImageName:nil ImageName:@"fghbgvb" SeleImage:nil Method:@selector(nextTouchUpInside:) target:self];
    [ self.ShowContrl addSubview:leftBtn];
    
    UIButton *botton = [CommonFunc createButtonFrame:CGRectMake(leftBtn.right,0, mScreenWidth - 50, 49) Title:@"开始赚钱" TitleColor:[UIColor whiteColor] font:20 BgColor:[UIColor colorWithHexString:@"0064DD"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(nextTouchUpInside:) target:self];
    [self.ShowContrl addSubview:botton];
    
    [self.txtView addSubview:self.ShowContrl];
    
    UIView *tView = [[UIView alloc]initWithFrame:CGRectMake((mScreenWidth - 300)/2,self.ShowContrl.bottom + 30, 300, 80)];
    tView.backgroundColor = [UIColor clearColor];
    
    UILabel *tLab = [CommonFunc createFontNameLabel:@"投资金额：" FontName:nil Size:15 TextColor:[UIColor colorWithHexString:@"D4D4D4"] Rect:CGRectMake(0,0,75,40) Align:NSTextAlignmentLeft ifBool:YES];
    [tView addSubview:tLab];
    
    UIImageView *linO = [[UIImageView alloc]initWithFrame:CGRectMake(tLab.right, tLab.bottom - 10, tView.width - tLab.right - 40, 1)];
    linO.backgroundColor = [UIColor blackColor];
    [tView addSubview:linO];
    
    [tView addSubview:[self yLabel:CGRectMake(linO.right + 10, tLab.top, 20, 40)]];
    
    self.addNum = [CommonFunc createTextFieldFrame:CGRectMake(linO.left + 5, linO.bottom - 21,linO.width - 10,  20) Placeholder:nil leftView:nil rightView:nil BgImageName:nil font:15];
    self.addNum.secureTextEntry = NO;//密码遮掩
    self.addNum.textColor = [UIColor colorWithHexString:@"007FFC"];
    self.addNum.textAlignment = NSTextAlignmentRight;
    self.addNum.delegate = self;
    self.addNum.returnKeyType = UIReturnKeyGo;
    self.addNum.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [tView addSubview: self.addNum];
    
    UILabel *sLab = [CommonFunc createFontNameLabel:@"产品预期收益：" FontName:nil Size:15 TextColor:[UIColor colorWithHexString:@"D4D4D4"] Rect:CGRectMake(0,tLab.bottom,75,39) Align:NSTextAlignmentLeft ifBool:YES];
    [tView addSubview:sLab];
    
    UIImageView *linT = [[UIImageView alloc]initWithFrame:CGRectMake(sLab.right, sLab.bottom - 10, tView.width - sLab.right - 40, 1)];
    linT.backgroundColor = [UIColor blackColor];
    [tView addSubview:linT];
   
    self.sMLab = [CommonFunc createLabel:@"10.00" FontSize:15 TextColor:[UIColor colorWithHexString:@"007FFC"]  Rect:CGRectMake(linT.left + 5, linT.bottom - 21, linT.width - 10, 20) Align:NSTextAlignmentRight];
    [tView addSubview:self.sMLab];
    
    [tView addSubview:[self yLabel:CGRectMake(linT.right+ 10, sLab.top, 20, 40)]];
   
    
    [self.txtView addSubview:tView];
}

- (UILabel *)yLabel:(CGRect)rect
{
    UILabel *label = [CommonFunc createLabel:@"元" FontSize:15 TextColor:[UIColor colorWithHexString:@"D4D4D4"] Rect:rect Align:NSTextAlignmentLeft];
    return label;
}

- (void)keyHide
{
    [self.addNum resignFirstResponder];
}

- (void)nextTouchUpInside:(UIButton *)sender
{
    NSInteger index = [self.ShowContrl.subviews indexOfObject:sender];
    switch (index)
    {
        case 0:
        {
            [UIView animateWithDuration:.2 animations:^{
                self.txtView.top  = mScreenHeight;
            } completion:^(BOOL finished) {
                [showView removeFromSuperview];
                self.bottomView.hidden = NO;
            }];
        }
            break;
            
        default:
            break;
    }
    NSLog(@"点击开始查看");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 }


@end
