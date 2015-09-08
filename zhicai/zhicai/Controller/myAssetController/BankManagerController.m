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

@interface BankManagerController ()<UITableViewDataSource,UITableViewDelegate,BankTableViewCellDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) NSString *delStr;

@end

@implementation BankManagerController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"银行卡管理";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    self.delStr = @"1";
    
    [self rightBarButtonItem];
    
    [self creatTableView];
    
    [self creatDeleView];
}

- (void)creatTableView
{
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, mScreenWidth, mScreenHeight - mStatusBarOffset) style:UITableViewStylePlain];
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
    
    UIImageView *addIMG = [CommonFunc creatImgeViewRect:CGRectMake((addView.width - 28)/2, 50, 28, 28) Color:[UIColor clearColor] Img:@"dsfccxvb" alpha:1];
    [addView addSubview:addIMG];
    
    UILabel *addLab = [CommonFunc createLabel:@"添加银行卡" FontSize:20 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake((addView.width - 100)/2, addIMG.bottom + 20, 100, 23) Align:NSTextAlignmentCenter];
    [addView addSubview:addLab];
    
    UITapGestureRecognizer *addTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addBank:)];
    footView.userInteractionEnabled = YES;
    [footView addGestureRecognizer:addTap];
    
    return footView;
}

#pragma mark  添加删除银行卡视图
- (void)creatDeleView
{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight, mScreenWidth, 92)];
    self.bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bottomView];
    
    UIButton *delBtn = [CommonFunc createButtonFrame:CGRectMake(0, 0, self.bottomView.width, 44) Title:@"删除银行卡" TitleColor:[UIColor colorWithHexString:@"ffffff"] font:20 BgColor:[UIColor colorWithHexString:@"0064DD"]BgImageName:nil ImageName:nil  SeleImage:nil Method:@selector(deleBankCardAction:) target:self];
    [self.bottomView addSubview:delBtn];
    
    UIButton *canBtn = [CommonFunc createButtonFrame:CGRectMake(0, delBtn.bottom + 5, delBtn.width, delBtn.height) Title:@"取消" TitleColor:[UIColor colorWithHexString:@"ffffff"] font:20 BgColor:[UIColor colorWithHexString:@"0064DD"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(deleBankCardAction:) target:self];
    [self.bottomView addSubview:canBtn];
    
}

//导航栏右侧按钮
-(void)rightBarButtonItem
{
    self.navigationItem.rightBarButtonItem = [CommonFunc customBarButtonItemTarget:self width:30 height:21 action:@selector(rightBarButtonTouchUpInside:) string:nil color:[UIColor clearColor] ImageName:@"sdhsjfsdcs"];
}

#pragma mark 点击事件
- (void)rightBarButtonTouchUpInside:(UIButton *)sender
{
    if ([self.delStr isEqualToString:@"1"])
    {
        self.mainTableView.tableFooterView.hidden = YES;
        self.delStr = @"2";
        [self.mainTableView reloadData];
        
        [self getView:self.bottomView Top:(mScreenHeight - self.bottomView.height - mStatusBarOffset) left:self.bottomView.left time:.3];
        [self.mainTableView setEditing:YES animated:YES];
    }
  else
  {
      self.delStr = @"1";
  }
}

- (void)deleBankCardAction:(UIButton *)sender
{
    NSInteger index = [self.bottomView.subviews indexOfObject:sender];
    switch (index)
    {
        case 0:
        {
            NSLog(@"删除银行卡");
        }
            break;
        case 1:
        {
             self.mainTableView.tableFooterView.hidden = NO;
            [self getView:self.bottomView Top:mScreenHeight left:self.bottomView.left time:.3];
            self.delStr = @"1";
            [self.mainTableView setEditing:NO animated:YES];
            NSLog(@"取消");
        }
            break;
        default:
            break;
    }
    [self.mainTableView reloadData];
}


- (void)getView:(UIView *)view Top:(CGFloat)top left:(CGFloat)left time:(CGFloat)time
{
    [UIView animateWithDuration:time animations:^{
        view.top = top;
        view.left = left;
    } completion:^(BOOL finished) {
        
    }];
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
    cell.delegate = self;
    if ([self.delStr isEqualToString:@"2"])
    {
        [self getView:cell.bottomView Top:cell.bottomView.top left:45 time:.05];
    }
    else
    {
        [self getView:cell.bottomView Top:cell.bottomView.top left:20 time:.05];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (rightButton.title== @"确定") {
//        [deleteDic setObject:indexPath forKey:[dataArray objectAtIndex:indexPath.row]];
//        
//    }
//    else {
//        
//    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (rightButton.title == @"确定")
//    {
//        [deleteDic removeObjectForKey:[dataArray objectAtIndex:indexPath.row]];
//    }
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}
- (void)deleBankCard:(NSString *)model
{
    NSLog(@"时间按国际城");
}

//添加银行卡
- (void)addBank:(UITapGestureRecognizer *)geature
{
    AddBankViewController *addVC = [[AddBankViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
    NSLog(@"添加银行卡");
}

@end
