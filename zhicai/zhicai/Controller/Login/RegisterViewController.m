//
//  RegisterViewController.m
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UILabel * clewLab;
    
    UITextField * phoneNum;
    UITextField * yanzhengFiled;
    UITextField * pwdField;
    UIButton * nextBtn;
    UIButton * getBtn;//发送验证码
}

@property (nonatomic , strong) NSTimer *codeTimer;

@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"注册";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    //通知中心，键盘的弹出和消失
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [self creatSubViews];
}

- (void)creatSubViews
{
    clewLab = [CommonFunc createLabel:@"获取短信(免费)验证码" FontSize:12 TextColor:[UIColor colorWithHexString:@"8E8E8E"] Rect:CGRectMake(0, 0, mScreenWidth, 44) Align:NSTextAlignmentCenter];
    [self.view addSubview:clewLab];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, clewLab.bottom, mScreenWidth, 145)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel * phoneLab = [CommonFunc createLabel:@"手机号" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 0, 50, 44) Align:NSTextAlignmentLeft];//createLabelFrame:CGRectMake(16, 0, 50, 47) font:15 Text:@"手机号"];
     [topView addSubview:phoneLab];
    
    phoneNum = [CommonFunc createTextFieldFrame:CGRectMake(100, 0, mScreenWidth-220, 44) Placeholder:@"请输入手机号码" leftView:nil rightView:nil BgImageName:nil font:14];
    phoneNum.delegate = self;
    phoneNum.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [topView addSubview:phoneNum];
    
    UIImageView *lineO = [CommonFunc creatImgeViewRect:CGRectMake(0, phoneLab.bottom, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [topView addSubview:lineO];
    
    UILabel * yanLab = [CommonFunc createLabel:@"验证码" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, lineO.bottom, 50, 44) Align:NSTextAlignmentLeft];
    [topView addSubview:yanLab];
    
    yanzhengFiled = [CommonFunc createTextFieldFrame:CGRectMake(100, yanLab.top, 100, 44) Placeholder:@"请输入验证码" leftView:nil rightView:nil BgImageName:nil font:14];
    yanzhengFiled.delegate = self;
    yanzhengFiled.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [topView addSubview:yanzhengFiled];
    
    UIImageView *lineT = [CommonFunc creatImgeViewRect:CGRectMake(0, yanLab.bottom, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [topView addSubview:lineT];
    
    
    UILabel * pwdLab = [CommonFunc createLabel:@"设置密码" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, lineT.bottom, 60, 44) Align:NSTextAlignmentLeft];
    [topView addSubview:pwdLab];
    
    
    pwdField = [CommonFunc createTextFieldFrame:CGRectMake(100, pwdLab.top, mScreenWidth - 200, 47) Placeholder:@"密码为6位纯数字" leftView:nil rightView:nil BgImageName:nil font:14];
    pwdField.delegate = self;
    pwdField.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [topView addSubview:pwdField];
    
    UIImageView *boIMG = [CommonFunc creatImgeViewRect:CGRectMake((mScreenWidth - 288) / 2, topView.bottom + 44, 288, 98) Color:[UIColor clearColor] Img:@"iconghbg" alpha:1];
    [self.view addSubview:boIMG];
 
    
    getBtn = [CommonFunc createButtonFrame:CGRectMake(mScreenWidth-100, phoneLab.top, 100, 44) Title:@"获取验证码" TitleColor:[UIColor colorWithHexString:@"1B8CFF"] font:15 BgColor:[UIColor whiteColor] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(getClick) target:self];
    getBtn.layer.borderColor = [[UIColor colorWithHexString:@"0074FF"]CGColor];
    getBtn.layer.borderWidth = 1.0f;
    
    [getBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [topView addSubview:getBtn];
    
    
    nextBtn =  [CommonFunc createButtonFrame:CGRectMake(0, mScreenHeight-49-mStatusBarOffset, mScreenWidth, 49) Title:@"马上注册" TitleColor:[UIColor colorWithHexString:@"ffffff"] font:20 BgColor:[UIColor colorWithHexString:@"D4D4D4"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(nextClick:) target:self];
    [self.view addSubview:nextBtn];

}

//获取验证码
- (void)getClick
{
   clewLab.text = @"验证码短信(免费)已发送";
    
}

//立即注册
- (void)nextClick:(UIButton *)sender
{

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKey];
    return YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideKey];
}

- (void)hideKey
{
    [phoneNum resignFirstResponder];
    [yanzhengFiled resignFirstResponder];
    [pwdField resignFirstResponder];
}

#pragma mark 键盘监听
- (void)keyboardWillShow:(NSNotification *)notif
{
    NSValue * aValue = [[notif userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoardSize;
    [aValue getValue:&keyBoardSize];
    [UIView animateWithDuration:.2 animations:^{
         nextBtn.frame = CGRectMake(0, mScreenHeight-keyBoardSize.size.height-49- mStatusBarOffset, mScreenWidth, 49);
        //      nextBtn.backgroundColor = [UIColor colorWithHexString:@"31424A"];
    } completion:^(BOOL finished){}];
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    [UIView animateWithDuration:.2 animations:^{
        nextBtn.frame = CGRectMake(0, mScreenHeight-49- mStatusBarOffset, mScreenWidth, 49);
        nextBtn.backgroundColor = [UIColor colorWithHexString:@"D4D4D4"];
    } completion:^(BOOL finished){}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
