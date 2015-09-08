//
//  ListViewController.m
//  zhicai
//
//  Created by MJP on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "ListViewController.h"
#import "HomeViewController.h"
@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   // self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBarHidden = NO;
    [self createNav];
    
}

-(void)createNav
{
     [self.navigationItem setHidesBackButton:YES];

    self.navigationItem.title = @"产品列表";
    
   
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 25, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"sdhsjhds"] forState:UIControlStateNormal];
    [backBtn addTarget: self action: @selector(goBackClick) forControlEvents: UIControlEventTouchUpInside];
    
    UIBarButtonItem *back=[[UIBarButtonItem alloc]initWithCustomView:backBtn];

    self.navigationItem.leftBarButtonItem = back;
}


-(void)goBackClick
{
    HomeViewController *home = [[HomeViewController alloc] init];

    [self.navigationController popViewControllerAnimated:YES];
}

@end
