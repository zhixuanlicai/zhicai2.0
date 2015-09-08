//
//  MygiftcerViewController.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "MyGiftcerViewController.h" 
#import "MyGiftcerCell.h"

@interface MyGiftcerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation MyGiftcerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我的优惠券";
    
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
    
    UIView *hView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 10)];
    hView.backgroundColor = [UIColor clearColor];
    self.mainTableView.tableHeaderView = hView;

}

#pragma mark 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 122;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *gCell = @"gCell";
    MyGiftcerCell *cell = [tableView dequeueReusableCellWithIdentifier:gCell];
    if (!cell)
    {
        cell = [[MyGiftcerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:gCell];
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
