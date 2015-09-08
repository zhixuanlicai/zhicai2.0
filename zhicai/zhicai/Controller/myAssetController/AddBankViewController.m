//
//  AddBankViewController.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "AddBankViewController.h"
#import "CBankViewController.h"

@interface AddBankViewController ()<UITextFieldDelegate>
{
    UIView * bankView;
    UITextField * nameFiled;
    UITextField * shenfenFiled;
    UITextField * kaFiled;
    UIButton * bangdingBtn;
    UIScrollView * myScrollView;
    
}

@end

@implementation AddBankViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.title = @"添加银行卡";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    [self creatSubViews];
    
    //通知中心，键盘的弹出和消失
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showKeyBoard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideKeyBoard:) name:UIKeyboardWillHideNotification object:nil];

}

#pragma mark 
- (void)creatSubViews
{
    myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, mScreenHeight-64)];
    [myScrollView setContentSize:CGSizeMake(mScreenWidth, mScreenHeight+100)];
    myScrollView.userInteractionEnabled = YES;
    myScrollView.showsVerticalScrollIndicator = NO;
    myScrollView.bounces = YES;
    [self.view addSubview:myScrollView];
    
    UITapGestureRecognizer *textTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKey)];
    myScrollView.userInteractionEnabled = YES;
    [myScrollView addGestureRecognizer:textTap];
    
    bankView = [[UIView alloc]initWithFrame:CGRectMake(0,0, mScreenWidth, 285)];
    bankView.userInteractionEnabled = YES;
    bankView.backgroundColor = [UIColor clearColor];
    [myScrollView addSubview:bankView];
    
    UILabel * infoLab = [CommonFunc createLabel:@"持卡人信息" FontSize:11 TextColor: [UIColor colorWithHexString:@"8E8E8E"] Rect:CGRectMake(11, 0, 200, 26) Align:NSTextAlignmentLeft];
    [bankView addSubview:infoLab];
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 26, mScreenWidth, 88)];
    view.userInteractionEnabled = YES;
    [bankView addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel * userLab = [CommonFunc createLabel:@"姓名" FontSize:15 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(11, 0, 30, 44) Align:NSTextAlignmentLeft];
    [view addSubview:userLab];
    
    nameFiled = [CommonFunc createTextFieldFrame:CGRectMake(90, 0, mScreenWidth - 11 - 90, 44) Placeholder:@"请输入持卡人姓名" leftView:nil rightView:nil BgImageName:nil font:15];
    nameFiled.delegate = self;
    nameFiled.keyboardType = UIReturnKeyDefault;
    [view addSubview:nameFiled];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, mScreenWidth, 1)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"D4D4D4"];
    [view addSubview:lineView];
    
    UILabel * pwdLab = [CommonFunc createLabel:@"身份证" FontSize:15 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(11, 44, 50, 44) Align:NSTextAlignmentLeft];
    [view addSubview:pwdLab];

    shenfenFiled = [CommonFunc createTextFieldFrame:CGRectMake(90, 44,mScreenWidth - 11 - 90, 44) Placeholder:@"请输入持卡人身份证号" leftView:nil rightView:nil BgImageName:nil font:15];
    shenfenFiled.delegate = self;
    shenfenFiled.returnKeyType = UIReturnKeyDone;
    [view addSubview:shenfenFiled];

    UILabel * inLab = [CommonFunc createLabel:@"请填写本人真实信息，核实后不可更改" FontSize:11 TextColor:[UIColor colorWithHexString:@"8E8E8E"] Rect:CGRectMake(0, 114, mScreenWidth, 20) Align:NSTextAlignmentCenter];
    inLab.textAlignment = YES;
    [bankView addSubview:inLab];

    UILabel * bankInfoLab = [CommonFunc createLabel:@"银行卡信息" FontSize:11 TextColor:[UIColor colorWithHexString:@"8E8E8E"] Rect:CGRectMake(11, 164, 80, 27) Align:NSTextAlignmentLeft];
    [bankView addSubview:bankInfoLab];
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 194, mScreenWidth, 88)];
    [bankView addSubview:view1];
    view1.backgroundColor = [UIColor whiteColor];
    UILabel * bankLab = [CommonFunc createLabel:@"银行" FontSize:15 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(11, 0, 30, 44) Align:NSTextAlignmentLeft ];
    bankLab.textAlignment = YES;
    [view1 addSubview:bankLab];
    
    UIButton * selBankBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    selBankBtn.frame = CGRectMake(90, 0, mScreenWidth-90, 44);
    [selBankBtn addTarget:self action:@selector(selClick) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:selBankBtn];
    
    self.bank = [CommonFunc createLabel:@"请选择银行卡" FontSize:15 TextColor:[UIColor colorWithHexString:@"8E8E8E"] Rect:CGRectMake(0, 0, 150, 44)  Align:NSTextAlignmentLeft];
    [selBankBtn addSubview:self.bank];
    
    
    UIView *lineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 43, mScreenWidth, 1)];
    lineView3.backgroundColor = [UIColor colorWithHexString:@"D4D4D4"];
    [view1 addSubview:lineView3];
    
    UILabel * kaLab = [CommonFunc createLabel:@"卡号" FontSize:15 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(11, 44, 30, 44) Align:NSTextAlignmentLeft];
    [view1 addSubview:kaLab];
    
    kaFiled = [CommonFunc createTextFieldFrame:CGRectMake(90, 44, mScreenWidth - 11 - 90, 44) Placeholder:@"请输入银行卡号" leftView:nil rightView:nil BgImageName:nil font:15];
    kaFiled.delegate = self;
    kaFiled.returnKeyType = UIReturnKeyGo;
    kaFiled.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [view1 addSubview:kaFiled];

    bangdingBtn = [CommonFunc createButtonFrame:CGRectMake(0, mScreenHeight-49-mStatusBarOffset, mScreenWidth, 49) Title:@"绑定" TitleColor:[UIColor whiteColor] font:15 BgColor:[UIColor colorWithHexString:@"A3A3A3"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(sureClick) target:self];
    bangdingBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    bangdingBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:bangdingBtn];
    
}

- (void)selClick
{
    
    NSLog(@"选择银行卡");
    CBankViewController * selectbankvc = [[CBankViewController alloc]init];
//    selectbankvc.addbank = self;
//    [self.passmodel passModel:selectbankvc.mybankmodel];
    [self.navigationController pushViewController:selectbankvc animated:YES];
}

//绑定请求
-(void)sureClick
{

}

#pragma mark textFiledDelegate
- (void)showKeyBoard:(NSNotification *)notification
{
    NSValue * aValue = [[notification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoardSize;
    [aValue getValue:&keyBoardSize];
    [UIView animateWithDuration:.2 animations:^{
        bangdingBtn.frame = CGRectMake(0, mScreenHeight-keyBoardSize.size.height-49- mStatusBarOffset, mScreenWidth, 49);
        bangdingBtn.backgroundColor = [UIColor colorWithHexString:@"31424A"];
    } completion:^(BOOL finished){}];
}
- (void)hideKeyBoard:(NSNotification *)notification
{
    [UIView animateWithDuration:.2 animations:^{
         bangdingBtn.frame = CGRectMake(0, mScreenHeight-49- mStatusBarOffset, mScreenWidth, 49);
        bangdingBtn.backgroundColor = [UIColor colorWithHexString:@"D4D4D4"];
    } completion:^(BOOL finished){}];
 
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [nameFiled resignFirstResponder];
    [shenfenFiled resignFirstResponder];
    [kaFiled resignFirstResponder];
    return YES;
    
}

- (void)hideKey
{
    [nameFiled resignFirstResponder];
    [shenfenFiled resignFirstResponder];
    [kaFiled resignFirstResponder];
}


@end
