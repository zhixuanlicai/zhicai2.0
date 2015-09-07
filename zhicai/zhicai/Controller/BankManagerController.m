//
//  BankmanagerViewController.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "BankManagerController.h"
#import "BankTableViewCell.h"
#import "AddBankViewController.h"

@interface BankManagerController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation BankManagerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"银行卡管理";
    [self creatTableView];
}

- (void)creatTableView
{
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, mScreenWidth, mScreenHeight - self.mainTableView.top) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.mainTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mainTableView];
    
    UIView *hView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 5)];
    hView.backgroundColor = [UIColor clearColor];
    self.mainTableView.tableHeaderView = hView;
    
    self.mainTableView.tableFooterView = [self footView];
    
}

- (UIView *)footView
{
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 175)];
    footView.backgroundColor = [UIColor clearColor];
    
    UIView *addView = [[UIView alloc]initWithFrame:CGRectMake(20, 10, footView.width - 40, 165)];
    addView.backgroundColor = [UIColor whiteColor];
    [footView addSubview:addView];
    
    UIImageView *addIMG = [CommonFunc creatImgeViewRect:CGRectMake((addView.width - 34)/2, 50, 34, 34) Color:[UIColor blackColor] Img:nil alpha:1];
    [addView addSubview:addIMG];
    
    UILabel *addLab = [CommonFunc createLabel:@"添加银行卡" FontSize:20 TextColor:[UIColor blackColor] Rect:CGRectMake((addView.width - 100)/2, addIMG.bottom + 20, 100, 23) Align:NSTextAlignmentCenter];
    [addView addSubview:addLab];
    
    UITapGestureRecognizer *addTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addBank:)];
    footView.userInteractionEnabled = YES;
    [footView addGestureRecognizer:addTap];
    
    return footView;
}

#pragma mark 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 175;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *bCell = @"gCell";
    BankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bCell];
    if (!cell)
    {
        cell = [[BankTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bCell];
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

//添加银行卡
- (void)addBank:(UITapGestureRecognizer *)geature
{
    AddBankViewController *addVC = [[AddBankViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
    NSLog(@"添加银行卡");
}

@end
