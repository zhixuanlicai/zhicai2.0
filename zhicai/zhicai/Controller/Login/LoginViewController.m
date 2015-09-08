//
//  LoginViewController.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    UIButton * loginBtn;
    UITextField * userFiled;
    UITextField * pwdFiled;
}

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"登录";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    self.navigationItem.rightBarButtonItem = [CommonFunc  customBarButtonItemTarget:self width:40 height:21 action:@selector(registerAction:) string:@"注册" color:nil ImageName:nil];
    
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
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 44, mScreenWidth, 90)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel * userLab = [CommonFunc createLabel:@"账号" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 0, 80, 44)  Align:NSTextAlignmentLeft];
   
    [topView addSubview:userLab];
    
    userFiled = [CommonFunc createTextFieldFrame:CGRectMake(100, 0, topView.width - 200, 44) Placeholder:@"用户名/电话号码" leftView:nil rightView:nil BgImageName:nil font:14];
    userFiled.delegate = self;
    userFiled.returnKeyType = UIReturnKeyGo;
    userFiled.keyboardType =  UIKeyboardTypeNumberPad;//数字键盘UIKeyboardTypeNamePhonePad;//UIKeyboardTypeNumbersAndPunctuation;//
    //   userFiled.returnKeyType = UIReturnKeyDefault;
    userFiled.text = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUserName];
    [topView addSubview:userFiled];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 44, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [topView addSubview:lineIMG];
    
    UILabel * pwdLab = [CommonFunc createLabel:@"密码" FontSize:15 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 45, 80, 44) Align:NSTextAlignmentLeft];
    [topView addSubview:pwdLab];
    
    pwdFiled = [CommonFunc createTextFieldFrame:CGRectMake(100, 45, 150, 44) Placeholder:@"请输入登录密码" leftView:nil rightView:nil BgImageName:nil font:15];
    pwdFiled.secureTextEntry = YES;//密码遮掩
    pwdFiled.delegate = self;
    pwdFiled.returnKeyType = UIReturnKeyGo;
    pwdFiled.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [topView addSubview:pwdFiled];
  
 
    UIButton * forgetBtn = [CommonFunc createButtonFrame:CGRectMake(topView.width-91, 45, 80, 44) Title:@"忘记密码" TitleColor:[UIColor colorWithHexString:@"f97252"] font:12 BgColor:[UIColor clearColor] BgImageName:nil ImageName:@"thgtgz" SeleImage:nil Method:@selector(forgetClick) target:self];
    forgetBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [topView addSubview:forgetBtn];
    
    UIImageView *linIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, topView.height - 1, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [topView addSubview:linIMG];
    
    UIImageView *boIMG = [CommonFunc creatImgeViewRect:CGRectMake((mScreenWidth - 288) / 2, topView.bottom + 44, 288, 98) Color:[UIColor clearColor] Img:@"iconghbg" alpha:1];
    [self.view addSubview:boIMG];
    
    loginBtn = [CommonFunc createButtonFrame:CGRectMake(0, mScreenHeight-49-mStatusBarOffset, mScreenWidth, 49) Title:@"立即登录" TitleColor:[UIColor colorWithHexString:@"ffffff"] font:20 BgColor:[UIColor colorWithHexString:@"D4D4D4"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(loginClick) target:self];
    [self.view addSubview:loginBtn];

}

- (void)registerAction:(UIButton *)sender
{
    RegisterViewController *regisVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regisVC animated:YES];
}

- (void)forgetClick
{
    ForgetViewController *forVC = [[ForgetViewController alloc]initWithIdentifer:@"1"];
    [self.navigationController pushViewController:forVC animated:YES];
}

//登录请求
- (void)loginClick
{
    NSLog(@"登录");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [userFiled resignFirstResponder];
    [pwdFiled resignFirstResponder];
    return YES;
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
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
