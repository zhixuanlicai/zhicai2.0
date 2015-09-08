//
//  InvestViewController.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "InvestViewController.h"

@interface InvestViewController ()

@end

@implementation InvestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"投资详情";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self ceatSubViews];
    
}


- (void)ceatSubViews
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, mScreenWidth, 44)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIImageView *rightIMG = [CommonFunc creatImgeViewRect:CGRectMake(mScreenWidth - 20, 14, 9, 15) Color:[UIColor clearColor] Img:@"dsfcsdxz" alpha:1];
    [topView addSubview:rightIMG];
    
    UILabel *tyLabel = [CommonFunc createLabel:@"产品名称" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"]  Rect:CGRectMake(11, 12, 150, 20) Align:NSTextAlignmentLeft];
    [topView addSubview:tyLabel];
    
    [topView addSubview:[self lineIMG:43]];
    
    UITapGestureRecognizer *topTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(topTouchUpInside:)];
    topView.userInteractionEnabled = YES;
    [topView addGestureRecognizer:topTap];
    
    //状态实现时间
    UILabel *timLab = [CommonFunc createLabel:@"智选天下一期" FontSize:15 TextColor:[UIColor colorWithHexString:@"878787"] Rect:CGRectMake(topView.width - 26 - 150, 14, 150, 16) Align:NSTextAlignmentRight];
    [topView addSubview:timLab];
    
    NSString *str = [CommonFunc  numFormatMoney:500 numberStyle:NSNumberFormatterCurrencyStyle];
    UIView *gView = [CommonFunc creatCellView:@"购买金额" rightTxt:[NSString stringWithFormat:@"%@元",str] top:topView.bottom];
    [self.view addSubview:gView];
    
    NSString *zStr = [CommonFunc  numFormatMoney:40 numberStyle:NSNumberFormatterCurrencyStyle];
    UIView *zView = [CommonFunc creatCellView:@"当前收益" rightTxt:[NSString stringWithFormat:@"%@元",zStr] top:gView.bottom];
    [self.view addSubview:zView];
    
    NSString *eStr = [CommonFunc  numFormatMoney:190 numberStyle:NSNumberFormatterCurrencyStyle];
    UIView *eView = [CommonFunc creatCellView:@"预计收益" rightTxt:[NSString stringWithFormat:@"%@元",eStr] top:zView.bottom];
    [self.view addSubview:eView];
    
    UIView *qView = [CommonFunc creatCellView:@"已购天数" rightTxt:[NSString stringWithFormat:@"%@天",@(20)] top:eView.bottom];
    [self.view addSubview:qView];
    
    UIView *tView = [CommonFunc creatCellView:@"购买时间" rightTxt:@"2015-03-23" top:qView.bottom];
    [self.view addSubview:tView];
    
    UIView *hView = [CommonFunc creatCellView:@"回款时间" rightTxt:@"2015-03-23" top:tView.bottom];
    [self.view addSubview:hView];
    
    //标的详情
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, hView.bottom, mScreenWidth, 44)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    [bottomView addSubview:[self lineIMG:43]];
    
    UILabel *bLab = [CommonFunc createLabel:@"标的详情" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 11, 150, 20) Align:NSTextAlignmentLeft];
    [bottomView addSubview:bLab];
    
    UIImageView *rigthIMG = [CommonFunc creatImgeViewRect:CGRectMake(mScreenWidth - 25, 13, 11, 17) Color:[UIColor clearColor] Img:@"dsfcsdxz" alpha:1];
    [bottomView addSubview:rigthIMG];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(detailTouchUpInside:)];
    bottomView.userInteractionEnabled = YES;
    [bottomView addGestureRecognizer:tap];
    
    [self.view addSubview:bottomView];
    
}

- (UIImageView *)lineIMG:(CGFloat)top
{
    UIImageView *linIMG = [CommonFunc creatImgeViewRect:CGRectMake(3, top, mScreenWidth - 6, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.5];
    return linIMG;
}

- (void)topTouchUpInside:(UITapGestureRecognizer *)gesture
{
    NSLog(@"产品名称");
}

- (void)detailTouchUpInside:(UITapGestureRecognizer *)gesture
{
    NSLog(@"标的详情");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end
