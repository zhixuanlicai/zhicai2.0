//
//  RecodsViewController.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "RecodsViewController.h"
#import "RecodsCell.h"
#import "ReDetailsViewController.h"

@interface RecodsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *listTableView;

@end

@implementation RecodsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"交易记录"; 
    
    [self creatTablView];
}

- (void)creatTablView
{
    self.listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,mScreenWidth,mScreenHeight -  mStatusBarOffset)];
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    self.listTableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.listTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.listTableView];
}

- (void)backTouchUpInside:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *rCell = @"rCell";
    RecodsCell *cell = [tableView  dequeueReusableCellWithIdentifier:rCell];
    if (!cell)
    {
        cell = [[RecodsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rCell];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];

    ReDetailsViewController *detailVC = [[ReDetailsViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

 

@end
