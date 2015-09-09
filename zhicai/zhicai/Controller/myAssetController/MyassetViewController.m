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
#import "formContrl.h"
#import "RecodsViewController.h"
#import "InvestViewController.h"
#import "LoginViewController.h"
@interface MyassetViewController ()<UITableViewDataSource,UITableViewDelegate,formContrlDelegate>

@property (nonatomic, strong)  UIView *topView;

@property (nonatomic, strong) UIView *tView;

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) formContrl *formContrl;

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
   
//    self.navigationController.navigationBarHidden = YES;
    
    self.parentViewController.navigationController.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.rightBarButtonItem = [CommonFunc customBarButtonItemTarget:self width:40 height:35 action:@selector(rightBarButtonTouchUpInside:) string:nil color:[UIColor blackColor] ImageName:nil];
    
    [self creatTopView];
    
    [self creatTableView];
}

- (void)rightBarButtonTouchUpInside:(id)sender
{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

#pragma mark 顶部视图
- (void)creatTopView
{
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0,0, mScreenWidth, mScreenHeight / 3)];
    [self.topView.layer addSublayer:[self shadowAsInverse:self.topView.width height:self.topView.height]];
    [self.view addSubview:self.topView];
    
    //总资产
    UIView *assetView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.topView.width , (self.topView.height)*2/3 )];
    assetView.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:assetView];
    
    UILabel *txtLabel = [CommonFunc createFontNameLabel:@"总资产(元)" FontName:@"Helvetica-Light" Size:15 TextColor:[UIColor whiteColor] Rect:CGRectMake((mScreenWidth - 100)/2,  assetView.height *1/3 -15, 100, 26) Align:NSTextAlignmentCenter ifBool:NO];
    [assetView addSubview:txtLabel];
    
    UIButton *wholeBtn = [CommonFunc createButtonFrame:CGRectMake(txtLabel.right - 23, assetView.height *1/3 -25, 40, 40) Title:nil TitleColor:nil font:15 BgColor:[UIColor clearColor] BgImageName:nil ImageName:@"fsecdfc" SeleImage:nil Method:@selector(wholeTouchUpInside:) target:self];
    [assetView addSubview:wholeBtn];
    
    NSString *str = [CommonFunc  numFormatMoney:1000.12 numberStyle:NSNumberFormatterCurrencyStyle];
    UILabel *mLabel = [CommonFunc createFontNameLabel:str FontName:@"Helvetica" Size:45 TextColor:[UIColor whiteColor] Rect:CGRectMake(10,txtLabel.bottom + 5, mScreenWidth - 20, 46) Align:NSTextAlignmentCenter ifBool:NO];
    [assetView addSubview:mLabel];
  
    UIImageView *lineImg = [CommonFunc  creatImgeViewRect:CGRectMake(0, assetView.height - 1, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"74AAFC"] Img:nil alpha:1];
    [assetView addSubview:lineImg];
    
    //总收益和昨日收益
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(0, assetView.frame.size.height, mScreenWidth, self.topView.frame.size.height - assetView.frame.size.height)];
    bView.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:bView];
    
    UILabel *inLab = [CommonFunc createFontNameLabel:@"总收益(元)" FontName:@"Helvetica-Light" Size:12 TextColor:[UIColor whiteColor] Rect:CGRectMake(10, (bView.height - 39) / 2, mScreenWidth/2 - 20, 15) Align:NSTextAlignmentCenter ifBool:NO];
    [bView addSubview:inLab];
    
    UILabel *inMoney = [CommonFunc createFontNameLabel:[CommonFunc  numFormatMoney:230 numberStyle:NSNumberFormatterCurrencyStyle] FontName:@"Helvetica-Light" Size:23 TextColor:[UIColor whiteColor] Rect:CGRectMake(10, inLab.bottom + 3, mScreenWidth/2 - 20, 24) Align:NSTextAlignmentCenter ifBool:NO];
    [bView addSubview:inMoney];
    
    UILabel *yLab = [CommonFunc createFontNameLabel:@"昨日收益(元)" FontName:@"Helvetica-Light" Size:12 TextColor:[UIColor whiteColor] Rect:CGRectMake(mScreenWidth/2 + 10 , inLab.top, mScreenWidth/2 - 20, 15) Align:NSTextAlignmentCenter ifBool:NO];
    [bView addSubview:yLab];
    
    UILabel *yMoney = [CommonFunc createFontNameLabel:[CommonFunc  numFormatMoney:2.5 numberStyle:NSNumberFormatterCurrencyStyle] FontName:@"Helvetica-Light" Size:23 TextColor:[UIColor whiteColor] Rect:CGRectMake(mScreenWidth/2 + 10,inLab.bottom + 3, mScreenWidth/2 - 20, 24) Align:NSTextAlignmentCenter ifBool:NO];
    [bView addSubview:yMoney];

}

#pragma mark UITableView
- (void)creatTableView
{
    self.listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.topView.height + self.topView.top, mScreenWidth, mScreenHeight - self.topView.height - self.topView.top - mStatusBarOffset) style:UITableViewStylePlain];
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
    
    NSArray *itemArr = @[@"sjdhesb",@"sjddsfdfb",@"sjddsewfb"];
    
    for (NSInteger i = 0; i < 3; i ++)
    {
        MyassetTopView *listView = [[MyassetTopView alloc]initWithFrame:CGRectMake(0,1 + i * 45, mScreenWidth, 45) IMGName:itemArr[i]];
        [self.tView addSubview:listView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureTap:)];
        listView.userInteractionEnabled = YES;
        [listView addGestureRecognizer:tap];
    }
    
    //我的理财标题栏
    UIView *liView = [[UIView alloc]initWithFrame:CGRectMake(0,tabHeadView.bottom - 45, mScreenWidth, 45)];
    [tabHeadView addSubview:liView];
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(14,10, 19, 19)  Color:[UIColor clearColor] Img:@"efsdesadxz@1x.png" alpha:1];
    [liView addSubview:leftIMG];
    
    UILabel *nameLab = [CommonFunc createLabel:@"我的理财" FontSize:13 TextColor:[UIColor  colorWithHexString:@"838A8D"] Rect:CGRectMake(leftIMG.right + 10, 10, 80, 20) Align:NSTextAlignmentLeft];
    [liView addSubview:nameLab];
    
}

- (void)wholeTouchUpInside:(UITapGestureRecognizer *)gesture
{
    [self addFormView];
}

#pragma mark 添加资产结构视图
- (void)addFormView
{
    self.formContrl = [[formContrl alloc]initWithFrame:APPDelegate.window.bounds];
    self.formContrl.top = mScreenHeight + 10;
    self.formContrl.delegate = self;
    [APPDelegate.window addSubview:self.formContrl];
    [UIView animateWithDuration:.3 animations:^{
        self.formContrl.top = 0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)deleContrlDelegate
{
    [UIView animateWithDuration:.3 animations:^{
        self.formContrl.top = mScreenHeight + 10;
    } completion:^(BOOL finished) {
        [self.formContrl removeFromSuperview];
    }];}

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
            cell.backgroundColor = [UIColor clearColor];
        }
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];

    InvestViewController *investVC = [[InvestViewController alloc]init];
    [self.navigationController pushViewController:investVC animated:YES];
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
       case 2:
        {
            RecodsViewController *recVC = [[RecodsViewController alloc]init];
            [self.navigationController pushViewController:recVC animated:YES];
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
