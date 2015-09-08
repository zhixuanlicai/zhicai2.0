//
//  NewSetViewController.m
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "NewSetViewController.h"

@interface NewSetViewController ()<UITextFieldDelegate>
{
    UIButton * loginBtn;
    UITextField * userFiled;
    UITextField * pwdFiled;
}
@end

@implementation NewSetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    
    self.title = @"重置密码";
    
    [self creatSubViews];
 }

- (void)creatSubViews
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 44, mScreenWidth, 90)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel * userLab = [CommonFunc createLabel:@"设置新密码" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 0, 80, 44)  Align:NSTextAlignmentLeft];
    
    [topView addSubview:userLab];
    
    userFiled = [CommonFunc createTextFieldFrame:CGRectMake(100, 0, topView.width - 200, 44) Placeholder:@"请设置新密码" leftView:nil rightView:nil BgImageName:nil font:14];
    userFiled.delegate = self;
    userFiled.returnKeyType = UIReturnKeyGo;
    userFiled.keyboardType =  UIKeyboardTypeNumberPad;//数字键盘UIKeyboardTypeNamePhonePad;//UIKeyboardTypeNumbersAndPunctuation;//
    //   userFiled.returnKeyType = UIReturnKeyDefault;
    userFiled.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUserName];
    [topView addSubview:userFiled];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 44, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [topView addSubview:lineIMG];
    
    UILabel * pwdLab = [CommonFunc createLabel:@"再次输入" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 45, 80, 44) Align:NSTextAlignmentLeft];
    [topView addSubview:pwdLab];
    
    pwdFiled = [CommonFunc createTextFieldFrame:CGRectMake(100, 45, 150, 44) Placeholder:@"请再次输入新密码" leftView:nil rightView:nil BgImageName:nil font:15];
    pwdFiled.secureTextEntry = YES;//密码遮掩
    pwdFiled.delegate = self;
    pwdFiled.returnKeyType = UIReturnKeyGo;
    pwdFiled.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [topView addSubview:pwdFiled];
    
    UIImageView *linIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, topView.height - 1, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [topView addSubview:linIMG];
    
    UIImageView *boIMG = [CommonFunc creatImgeViewRect:CGRectMake((mScreenWidth - 288) / 2, topView.bottom + 44, 288, 98) Color:[UIColor clearColor] Img:@"iconghbg" alpha:1];
    [self.view addSubview:boIMG];
    
    loginBtn = [CommonFunc createButtonFrame:CGRectMake(0, mScreenHeight-49-mStatusBarOffset, mScreenWidth, 49) Title:@"立即登录" TitleColor:[UIColor colorWithHexString:@"ffffff"] font:20 BgColor:[UIColor colorWithHexString:@"D4D4D4"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(loginClick) target:self];
    [self.view addSubview:loginBtn];
    
}

//登录
- (void)loginClick
{
    NSLog(@"登录");
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
    [userFiled resignFirstResponder];
    [pwdFiled resignFirstResponder];
}

#pragma mark 键盘监听
- (void)keyboardWillShow:(NSNotification *)notif
{
    NSValue * aValue = [[notif userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoardSize;
    [aValue getValue:&keyBoardSize];
    [UIView animateWithDuration:.2 animations:^{
        loginBtn.frame = CGRectMake(0, mScreenHeight-keyBoardSize.size.height-49- mStatusBarOffset, mScreenWidth, 49);
        //        loginBtn.backgroundColor = [UIColor colorWithHexString:@"31424A"];
    } completion:^(BOOL finished){}];
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    [UIView animateWithDuration:.2 animations:^{
        loginBtn.frame = CGRectMake(0, mScreenHeight-49- mStatusBarOffset, mScreenWidth, 49);
        loginBtn.backgroundColor = [UIColor colorWithHexString:@"D4D4D4"];
    } completion:^(BOOL finished){}];
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    //删除通知中心
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

 

@end
