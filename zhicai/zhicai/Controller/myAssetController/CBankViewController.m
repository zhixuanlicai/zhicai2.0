//
//  CBankViewController.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "CBankViewController.h"
#import "CBankTableViewCell.h"

@interface CBankViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, assign) NSInteger whichIndex;

@end

@implementation CBankViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"选择银行";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self creatTableView];
    
    [self addSureButton];
    
}

- (void)addSureButton
{
    self.sureBtn = [CommonFunc createButtonFrame:CGRectMake(0, mScreenHeight-49-mStatusBarOffset, mScreenWidth, 49) Title:@"确认" TitleColor:[UIColor whiteColor] font:15 BgColor:[UIColor colorWithHexString:@"A3A3A3"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(sureClickTouchUpInside:) target:self];
    [self.view addSubview:self.sureBtn];
}

- (void)creatTableView
{
    self.listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,mScreenWidth,mScreenHeight -  mStatusBarOffset)];
     self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    self.listTableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.listTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.listTableView]; 
}

#pragma mark 确认选定
- (void)sureClickTouchUpInside:(UIButton *)sender
{
    NSLog(@"确认选择");
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *sCell = @"sCell";
    CBankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sCell];
    if (!cell)
    {
        cell = [[CBankTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    
    if (self.whichIndex == indexPath.row)
    {
        cell.nameLabel.textColor = [UIColor colorWithHexString:@"4D595D"];
        cell.leftIMG.backgroundColor = [UIColor redColor];
        cell.rightIMG.backgroundColor = [UIColor redColor];
    }
    else
    {
        cell.nameLabel.textColor = [UIColor lightGrayColor];
        cell.leftIMG.backgroundColor = [UIColor blackColor];
        cell.rightIMG.backgroundColor = [UIColor blackColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.whichIndex = indexPath.row;
    
    [self.listTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
