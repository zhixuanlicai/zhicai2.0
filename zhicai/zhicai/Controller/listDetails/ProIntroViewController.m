//
//  ProIntroViewController.m
//  zhicai
//
//  Created by D on 15/9/9.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "ProIntroViewController.h"

@interface ProIntroViewController ()

@property (nonatomic, strong) UIScrollView *scrollContrl;

@end

@implementation ProIntroViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"项目介绍";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self creatMainSubViews];
}

- (void)creatMainSubViews
{
    self.scrollContrl = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollContrl];
    [self creatBaseInfoView];

}

//项目基本信息
- (void)creatBaseInfoView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 700)];
    [view addSubview:[self headView:CGRectMake(0, 0, mScreenWidth, 45) name:@"项目基本信息"]];
     
    [self.scrollContrl addSubview:view];
}

//头视图种类
- (UIView *)headView:(CGRect)rect name:(NSString *)name
{
    UIView *headView = [[UIView alloc]initWithFrame:rect];
    
    UIImageView *leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(13, (headView.height - 5)/2, 5, 5)];
    leftImg.backgroundColor = [UIColor colorWithHexString:@"4C595D"];
    leftImg.layer.masksToBounds = YES;
    leftImg.layer.borderColor = leftImg.backgroundColor.CGColor;
    leftImg.layer.borderWidth = 1;
    leftImg.layer.cornerRadius = 3;
    [headView addSubview:leftImg];
    
    UILabel *baseLab = [CommonFunc createLabel:name FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(leftImg.right + 5, (headView.height - 20)/2, mScreenWidth - leftImg.right - 5 - 11, 20) Align:NSTextAlignmentLeft];
    [headView addSubview:baseLab];
    
    return headView;
}

//借款申请人及项目基本信息视图种类

//资金用途及还款来源视图种类

//申报人保障信息视图种类

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 }



@end
