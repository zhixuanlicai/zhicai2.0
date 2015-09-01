//
//  BaseViewController.m
//  JimuPiza
//
//  Created by 王燕燕 on 14/12/3.
//  Copyright (c) 2014年 王燕燕. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
        ATMHud* hubATM;
}

@end

@implementation BaseViewController

- (void)loadView
{
    [super loadView];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_back.png" andHighImageName:@"icon_back.png" target:self action:@selector(backBtnAction:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnAction:)];
    //手势
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backBtnAction:)];
    [self.view addGestureRecognizer:swipe];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f6f6f6"]];
    // Do any additional setup after loading the view.
}

- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 与网络连接相关
- (void)showBlockHubIndicator
{
    if (hubATM == nil)
    {
        hubATM = [[ATMHud alloc] initWithDelegate:self];
        [self.view.window addSubview:hubATM.view];
        [hubATM setCaption:@" 加载中... "];
        [hubATM setActivity:YES];
        [hubATM setBlockTouches:YES];
        [hubATM show];
    }
}
- (void)hideBlockHubIdicator
{
    if (hubATM != nil)
    {
        [hubATM hide];
        [hubATM.view removeFromSuperview];
        hubATM = nil;
    }
}
- (void)showLongToast:(NSString*)msg
{
    ATMHud *toast = [[ATMHud alloc] initWithDelegate:self];
    [self.view.window addSubview:toast.view];
    [toast setCaption:msg];
    [toast setCenter:CGPointMake(mScreenWidth / 2 , mScreenHeight * 0.8)];
    [toast show];
    [toast hideAfter:3.0];
}
- (void)showShortToast:(NSString*)msg
{
    ATMHud *toast = [[ATMHud alloc] initWithDelegate:self];
    [self.view.window addSubview:toast.view];
    [toast setCaption:msg];
    [toast setCenter:CGPointMake(mScreenWidth / 2 , mScreenHeight * 0.8)];
    [toast show];
    [toast hideAfter:1.5];
}
- (void)showShortToastCenter:(NSString*)msg
{
    ATMHud *toast = [[ATMHud alloc] initWithDelegate:self];
    [self.view.window addSubview:toast.view];
    [toast setCaption:msg];
    [toast show];
    [toast hideAfter:1.5];
}


- (void)showHubIndicatorWithTitle:(NSString*)title ShowActivity:(BOOL)showActivity Cancancel:(BOOL)canCancel
{
    if (hubATM == nil)
    {
        hubATM = [[ATMHud alloc] initWithDelegate:self];
        [self.view.window addSubview:hubATM.view];
        [hubATM setCaption:title];
        [hubATM setActivity:showActivity];
        [hubATM setBlockTouches:(!canCancel)];
        [hubATM show];
        [hubATM hideAfter:(kHttpConnectionTimeoutSec + 5)];
    }
}

- (void)hideHubIndicator
{
    if (hubATM != nil)
    {
        [hubATM hide];
        [hubATM.view removeFromSuperview];
        hubATM = nil;
    }
}


- (void)showNoneTip:(NSString*)title Top:(int)top
{
    if (self.imageForNone == nil)
    {
        self.imageForNone = [[UIImageView alloc] initWithFrame:CGRectMake((mScreenWidth-126*mWidthPercentageWith5s)/2, top, 126*mWidthPercentageWith5s, 126*mHeightPercentageWith5s)];
        self.imageForNone.image = [UIImage imageNamed:@"borrow_record_empty.png"];
        [self.view addSubview:self.imageForNone];
    }
    
    if (self.labelForNone == nil && title != nil)
    {
        self.labelForNone = [CommonFunc createLabel:title FontSize:19 TextColor:[UIColor lightGrayColor] Rect:CGRectMake(0, top + 126*mHeightPercentageWith5s + 40*mHeightPercentageWith5s, mScreenWidth, 20*mHeightPercentageWith5s) Align:NSTextAlignmentCenter];
        [self.view addSubview:self.labelForNone];
    }
}
- (void)hideNoneTip
{
    if (self.imageForNone != nil)
    {
        [self.imageForNone removeFromSuperview];
        self.imageForNone.image = nil;
        self.imageForNone = nil;
    }
    
    if (self.labelForNone != nil)
    {
        [self.labelForNone removeFromSuperview];
        self.labelForNone = nil;
    }
}
- (void)showNoneTip2:(NSString*)title Top:(int)top
{
    if (self.imageForNone2 == nil)
    {
        self.imageForNone2 = [[UIImageView alloc] initWithFrame:CGRectMake((mScreenWidth-96*mWidthPercentageWith5s)/2, top, 96*mWidthPercentageWith5s, 96*mHeightPercentageWith5s)];
        self.imageForNone2.image = [UIImage imageNamed:@"user_head.png"];
        [self.view addSubview:self.imageForNone2];
    }
    
    if (self.labelForNone2 == nil && title != nil)
    {
        self.labelForNone2 = [CommonFunc createLabel:title FontSize:16 TextColor:[UIColor lightGrayColor] Rect:CGRectMake(0, top + 96*mHeightPercentageWith5s + 21*mHeightPercentageWith5s, mScreenWidth, 40*mHeightPercentageWith5s) Align:NSTextAlignmentCenter];
        self.labelForNone2.numberOfLines = 0;
        [self.view addSubview:self.labelForNone2];
    }
}

- (void)hideNoneTip2
{
    if (self.imageForNone2 != nil)
    {
        [self.imageForNone2 removeFromSuperview];
        self.imageForNone2.image = nil;
        self.imageForNone2 = nil;
    }
    
    if (self.labelForNone2 != nil)
    {
        [self.labelForNone2 removeFromSuperview];
        self.labelForNone2 = nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
