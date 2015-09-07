//
//  AddBankViewController.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "AddBankViewController.h"

@interface AddBankViewController ()

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, strong) UITextField *nameField;

@property (nonatomic, strong) UITextField *IDField;

@property (nonatomic, strong) UITextField *bankField;

@end

@implementation AddBankViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.title = @"添加银行卡";
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"F0EFF5"];
    
    [self creatSubViews];

}

#pragma mark 
- (void)creatSubViews
{
    self.mainScrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, mScreenHeight)];
    self.mainScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mainScrollView];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 150)];
    topView.backgroundColor = [UIColor greenColor];
    [self.mainScrollView addSubview:topView];
    
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, topView.bottom, mScreenWidth, 137)];
    bottomView.backgroundColor = [UIColor redColor];
    [self.mainScrollView addSubview:bottomView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
