//
//  StateViewController.m
//  zhicai
//
//  Created by D on 15/9/9.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "StateViewController.h"

@interface StateViewController ()

@property (nonatomic, strong) UIView *bottomView;

@end

@implementation StateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"交易状态";
    self.navigationItem.hidesBackButton = YES;
//    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self creatSucTopView];
    
    [self creatButtomView:238+22 + 32];
    
 }

//285 × 238交易成功展示图片
- (void)creatSucTopView
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake((mScreenWidth - 285)/2, 32, 285, 238)];
    [self.view addSubview:topView];

    UIImageView *bgImg = [[UIImageView alloc]initWithFrame:topView.bounds];
    bgImg.image = [UIImage imageNamed:@"atrygth"];
    [topView addSubview:bgImg];
    
    UILabel *timLab = [CommonFunc createLabel:@"预计显示收益时间: 2015-03-06" FontSize:11 TextColor:[UIColor whiteColor] Rect:CGRectMake(20, 0, topView.width - 40, 20) Align:NSTextAlignmentLeft];
    [topView addSubview:timLab];
    
    //222 × 79 atsafsdc
    UIImageView *qIMG = [CommonFunc creatImgeViewRect:CGRectMake((topView.width - 222)/2, topView.height - 22 - 79, 222, 79) Color:nil Img:@"atsafsdc" alpha:1];
    [topView addSubview:qIMG];
    
    
}

//交易失败时候展示图片284 × 148
- (void)creatFaiTopView
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake((mScreenWidth - 284)/2, 32, 284, 148)];
    [self.view addSubview:topView];
    
    UIImageView *bgImg = [[UIImageView alloc]initWithFrame:topView.bounds];
    bgImg.image = [UIImage imageNamed:@"atrygth"];
    [topView addSubview:bgImg];
}

//149
- (void)creatButtomView:(CGFloat)top
{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(20, top, mScreenWidth - 40, 149)];
    self.bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bottomView];
    
    UIButton *shareBtn = [self button:CGRectMake(0, 0, self.bottomView.width, 44)  title:@"唤好友一起抢钱" color:[UIColor colorWithHexString:@"f05e51"] titleColor:[UIColor whiteColor] border:1.0];
    [self.bottomView addSubview:shareBtn];
    
    UIButton *nextBtn = [self button:CGRectMake(0, shareBtn.bottom + 8, shareBtn.width, shareBtn.height) title:@"继续抢钱" color:[UIColor whiteColor] titleColor:[UIColor colorWithHexString:@"4C595D"] border:1.0];
    [self.bottomView addSubview:nextBtn];
    
    UIButton *backBtn = [self button:CGRectMake(0, nextBtn.bottom + 8, nextBtn.width, nextBtn.height) title:@"返回我的资产" color:[UIColor whiteColor] titleColor:[UIColor colorWithHexString:@"4C595D"] border:1.0];
    [self.bottomView addSubview:backBtn];
    
}

- (UIButton *)button:(CGRect)rect title:(NSString *)name color:(UIColor *)color titleColor:(UIColor *)titlecolor border:(CGFloat)width
{
   UIButton *button = [CommonFunc createButtonFrame:rect Title:name TitleColor:titlecolor font:20 BgColor:color BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(bottomTouchUpInside:) target:self];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.layer.borderColor = color.CGColor;
    button.layer.borderWidth = width;
    return button;
}

- (void)bottomTouchUpInside:(UIButton *)sender
{
    NSInteger index = [self.bottomView.subviews indexOfObject:sender];
    switch (index)
    {
        case 0:
            NSLog(@"分享");
            break;
        case 1:
            NSLog(@"继续");
            break;
        case 2:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
