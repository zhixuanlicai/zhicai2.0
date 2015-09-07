//
//  MyassetViewController.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "MyassetViewController.h"
#import "MyassetTaCell.h"
#import "MyassetTopView.h"
#import "MyGiftcerViewController.h"
#import "BankManagerController.h"

@interface MyassetViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)  UIView *topView;

@property (nonatomic, strong) UIView *tView;

@property (nonatomic, strong) UITableView *listTableView;

@end

@implementation MyassetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我的资产";
    //标题颜色
//    [self.navigationController.navigationBar setTitleTextAttributes:@{
//                                                                      UITextAttributeTextColor : [UIColor whiteColor]
//                                                                      }];
  
    self.view.backgroundColor = [UIColor colorWithHexString:@"F0EFF5"];
//    self.navigationController.navigationBarHidden = YES;
    
    [self creatTopView];
    
    [self creatTableView];
}


#pragma mark 顶部视图
- (void)creatTopView
{
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0,64, mScreenWidth, mScreenHeight / 3)];
    [self.topView.layer addSublayer:[self shadowAsInverse:self.topView.width height:self.topView.height]];
    [self.view addSubview:self.topView];
    
    //总资产
    UIView *assetView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.topView.frame.size.width , (self.topView.frame.size.height)*2/3 )];
    assetView.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:assetView];
    
    UILabel *txtLabel = [CommonFunc createFontNameLabel:@"总资产(元)" FontName:@"Helvetica-Light" Size:15 TextColor:[UIColor whiteColor] Rect:CGRectMake((mScreenWidth - 100)/2, 35, 100, 26) Align:NSTextAlignmentCenter];
    [assetView addSubview:txtLabel];
    
    NSString *str = [CommonFunc  numFormatMoney:1000.12 numberStyle:NSNumberFormatterCurrencyStyle];
    UILabel *mLabel = [CommonFunc createFontNameLabel:str FontName:@"Helvetica" Size:45 TextColor:[UIColor whiteColor] Rect:CGRectMake(10,67, mScreenWidth - 20, 46) Align:NSTextAlignmentCenter];
    [assetView addSubview:mLabel];
  
    UIImageView *lineImg = [CommonFunc  creatImgeViewRect:CGRectMake(0, assetView.frame.size.height - 1, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"74AAFC"] Img:nil alpha:1];
    [assetView addSubview:lineImg];
    
    //总收益和昨日收益
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(0, assetView.frame.size.height, mScreenWidth, self.topView.frame.size.height - assetView.frame.size.height)];
    bView.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:bView];
    
    UILabel *inLab = [CommonFunc createFontNameLabel:@"总收益(元)" FontName:@"Helvetica-Light" Size:12 TextColor:[UIColor whiteColor] Rect:CGRectMake(10, 15, mScreenWidth/2 - 20, 15) Align:NSTextAlignmentCenter];
    [bView addSubview:inLab];
    
    UILabel *inMoney = [CommonFunc createFontNameLabel:[CommonFunc  numFormatMoney:230 numberStyle:NSNumberFormatterCurrencyStyle] FontName:@"Helvetica-Light" Size:23 TextColor:[UIColor whiteColor] Rect:CGRectMake(10, 35, mScreenWidth/2 - 20, 24) Align:NSTextAlignmentCenter];
    [bView addSubview:inMoney];
    
    UILabel *yLab = [CommonFunc createFontNameLabel:@"昨日收益(元)" FontName:@"Helvetica-Light" Size:12 TextColor:[UIColor whiteColor] Rect:CGRectMake(mScreenWidth/2 + 10 , 15, mScreenWidth/2 - 20, 15) Align:NSTextAlignmentCenter];
    [bView addSubview:yLab];
    
    UILabel *yMoney = [CommonFunc createFontNameLabel:[CommonFunc  numFormatMoney:2.5 numberStyle:NSNumberFormatterCurrencyStyle] FontName:@"Helvetica-Light" Size:23 TextColor:[UIColor whiteColor] Rect:CGRectMake(mScreenWidth/2 + 10,35, mScreenWidth/2 - 20, 24) Align:NSTextAlignmentCenter];
    [bView addSubview:yMoney];

}

#pragma mark UITableView
- (void)creatTableView
{
    self.listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.topView.height + self.topView.top, mScreenWidth, mScreenHeight - self.topView.height - self.topView.top) style:UITableViewStylePlain];
    NSLog(@"self.yops %f",self.listTableView.height);
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    self.listTableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.listTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.listTableView];
    
    [self creatTabHeadView];
}

#pragma mark 头视图
- (void)creatTabHeadView
{
    UIView *tabHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 210)];
    tabHeadView.backgroundColor = [UIColor clearColor];
    
    self.listTableView.tableHeaderView = tabHeadView;
    
    self.tView = [[UIView alloc]initWithFrame:CGRectMake(0, 11, mScreenWidth, 155)];
    
    self.tView.backgroundColor = [UIColor clearColor];
    
    [tabHeadView addSubview:self.tView];

    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0,10, mScreenWidth, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.1];
    [tabHeadView addSubview:lineIMG];
    
    for (NSInteger i = 0; i < 3; i ++)
    {
        MyassetTopView *listView = [[MyassetTopView alloc]initWithFrame:CGRectMake(0,1 + i * 45, mScreenWidth, 45)];
        [self.tView addSubview:listView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureTap:)];
        listView.userInteractionEnabled = YES;
        [listView addGestureRecognizer:tap];
    }
    
    //我的理财标题栏
    UIView *liView = [[UIView alloc]initWithFrame:CGRectMake(0,tabHeadView.bottom - 45, mScreenWidth, 45)];
    [tabHeadView addSubview:liView];
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(10,10, 20, 20)  Color:[UIColor greenColor] Img:nil alpha:1];
    [liView addSubview:leftIMG];
    
    UILabel *nameLab = [CommonFunc createLabel:@"我的理财" FontSize:13 TextColor:[UIColor  colorWithHexString:@"838A8D"] Rect:CGRectMake(leftIMG.right + 10, 10, 80, 20) Align:NSTextAlignmentLeft];
    [liView addSubview:nameLab];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
       return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *iCell = @"listCell";
        MyassetTaCell *cell = [tableView dequeueReusableCellWithIdentifier:iCell];
        if (!cell)
        {
            cell = [[MyassetTaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"投资详情");
}

#pragma mark 手势
- (void)gestureTap:(UITapGestureRecognizer *)gesture
{
    NSInteger index = [self.tView.subviews indexOfObject:gesture.view];
    NSLog(@"tap %@",@(index));
    
    switch (index)
    {
        case 0:
        {
            MyGiftcerViewController *giftCer = [[MyGiftcerViewController alloc]init];
            [self.navigationController pushViewController:giftCer animated:YES];
        }

            break;
        case 1:
        {
            BankManagerController *bankVC = [[BankManagerController alloc]init];
            [self.navigationController pushViewController:bankVC animated:YES];
        }
            break;
        default:
            break;
    }
}


//顶部视图背景颜色渐变
- (CAGradientLayer *)shadowAsInverse:(CGFloat)width height:(CGFloat)height
{
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    CGRect newGradientLayerFrame = CGRectMake(0, 0,width,height);
    gradientLayer.frame = newGradientLayerFrame;
    
    //添加渐变的颜色组合
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithHexString:@"217DFD"]CGColor],
                            (id)[[UIColor colorWithHexString:@"1E63F0"]CGColor],
                            /*(id)[[UIColor redColor] CGColor],
                             (id)[[UIColor clearColor] CGColor],*/
                            nil];
    
    //    gradientLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],
    //                               [NSNumber numberWithFloat:0.2],
    //                               [NSNumber numberWithFloat:0.4],
    //                               [NSNumber numberWithFloat:0.9],
    //                               nil];
    
    gradientLayer.startPoint = CGPointMake(0,0);
    gradientLayer.endPoint = CGPointMake(0,1);
    return gradientLayer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end
