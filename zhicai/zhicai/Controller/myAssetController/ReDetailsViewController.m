//
//  ReDetailsViewController.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "ReDetailsViewController.h"

@interface ReDetailsViewController ()

@end

@implementation ReDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.title = @"交易记录";
    
     self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self ceatSubViews];
}

- (void)ceatSubViews
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 75)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIImageView *lefIMG = [CommonFunc creatImgeViewRect:CGRectMake(11, 23, 28, 28) Color:[UIColor blackColor] Img:nil alpha:1];
    [topView addSubview:lefIMG];
    
    UILabel *tyLabel = [CommonFunc createLabel:@"交易成功" FontSize:20 TextColor:[UIColor colorWithHexString:@"4C595D"]  Rect:CGRectMake(lefIMG.right + 11, 25, 150, 24) Align:NSTextAlignmentLeft];
    [topView addSubview:tyLabel];
    
    [topView addSubview:[self lineIMG:74]];
    
    //状态实现时间
    UILabel *timLab = [CommonFunc createLabel:@"2015-03-05 15:24:20" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C9DFF"] Rect:CGRectMake(topView.width - 161, 29, 150, 16) Align:NSTextAlignmentRight];
    [topView addSubview:timLab];
    
    UIView *nView = [CommonFunc creatCellView:@"产品名称" rightTxt:@"智选天下一期" top:100];
    [self.view addSubview:nView];
    
    NSString *str = [CommonFunc  numFormatMoney:500 numberStyle:NSNumberFormatterCurrencyStyle];
    UIView *gView = [CommonFunc creatCellView:@"购买金额" rightTxt:[NSString stringWithFormat:@"%@元",str] top:nView.bottom];
    [self.view addSubview:gView];
    
      NSString *zStr = [CommonFunc  numFormatMoney:40 numberStyle:NSNumberFormatterCurrencyStyle];
    UIView *zView = [CommonFunc creatCellView:@"总收益" rightTxt:[NSString stringWithFormat:@"%@元",zStr] top:gView.bottom];
    [self.view addSubview:zView];
    
    UIView *qView = [CommonFunc creatCellView:@"购买期限" rightTxt:[NSString stringWithFormat:@"%@天",@(18)] top:zView.bottom];
    [self.view addSubview:qView];
    
    UIView *hView = [CommonFunc creatCellView:@"回款时间" rightTxt:@"2015-03-23" top:qView.bottom];
    [self.view addSubview:hView];
    
    //标的详情
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, hView.bottom, mScreenWidth, 44)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    [bottomView addSubview:[self lineIMG:43]];
    
    UILabel *bLab = [CommonFunc createLabel:@"标的详情" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 11, 150, 20) Align:NSTextAlignmentLeft];
    [bottomView addSubview:bLab];
    
    UIImageView *rigthIMG = [CommonFunc creatImgeViewRect:CGRectMake(mScreenWidth - 25, 12, 14, 19) Color:[UIColor blackColor] Img:nil alpha:1];
    [bottomView addSubview:rigthIMG];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(detailTouchUpInside:)];
    bottomView.userInteractionEnabled = YES;
    [bottomView addGestureRecognizer:tap];

    [self.view addSubview:bottomView];
    
}

- (UIImageView *)lineIMG:(CGFloat)top
{
    UIImageView *linIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, top, mScreenWidth, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.5];
    return linIMG;
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
