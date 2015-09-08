//
//  ForgetViewController.m
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "ForgetViewController.h"
#import "NewSetViewController.h"

@interface ForgetViewController ()<UITextFieldDelegate>
{
    UILabel *clewLab;
    UITextField * cardNum;
    UITextField * phoneNum;
    UITextField * yanzhengFiled;
    
    UIButton *getBtn;//发送验证码
    UIButton *nextBtn;

}

@property (nonatomic , strong) NSTimer *codeTimer;

@property (nonatomic, strong) NSString *identifer;

@end

@implementation ForgetViewController

- (id)initWithIdentifer:(NSString *)identifer
{
    self = [super init];
    if (self)
    {
        _identifer = identifer;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"忘记密码";
    
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
    
    //初始化定时器
    self.codeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFired:) userInfo:nil repeats:YES];
    
    [self creatClewLab];
    
    if ([self.identifer isEqualToString:@"1"])
    {
        [self creatTopView];
        
        [self creatBottomView:89];
    }
    else
    {
          [self creatBottomView:clewLab.bottom];
    }
    
 }

- (void)creatClewLab
{
    clewLab = [CommonFunc createLabel:@"获取短信(免费)验证码" FontSize:12 TextColor:[UIColor colorWithHexString:@"8E8E8E"] Rect:CGRectMake(0, 0, mScreenWidth, 44) Align:NSTextAlignmentCenter];
    [self.view addSubview:clewLab];
}

- (void)creatTopView
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, clewLab.bottom, mScreenWidth, 45)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIImageView *lineI = [CommonFunc creatImgeViewRect:CGRectMake(0, topView.height - 1, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [topView addSubview:lineI];
    
    UILabel * phoneLab = [CommonFunc createLabel:@"身份证" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 0, 50, 44) Align:NSTextAlignmentLeft];//createLabelFrame:CGRectMake(16, 0, 50, 47) font:15 Text:@"手机号"];
    [topView addSubview:phoneLab];
    
    phoneNum = [CommonFunc createTextFieldFrame:CGRectMake(100, 0, mScreenWidth-110, 44) Placeholder:@"请输入身份证号码" leftView:nil rightView:nil BgImageName:nil font:14];
    phoneNum.delegate = self;
    phoneNum.keyboardType = UIKeyboardTypeNumbersAndPunctuation;//数字键盘
    [topView addSubview:phoneNum];
    
}

- (void)creatBottomView:(CGFloat)top
{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, top, mScreenWidth, 90)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel * yanLab = [CommonFunc createLabel:@"手机号" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, 0, 50, 44) Align:NSTextAlignmentLeft];
    [bottomView addSubview:yanLab];
    
    yanzhengFiled = [CommonFunc createTextFieldFrame:CGRectMake(100, yanLab.top, 100, 44) Placeholder:@"请输入手机号码" leftView:nil rightView:nil BgImageName:nil font:14];
    yanzhengFiled.delegate = self;
    yanzhengFiled.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [bottomView addSubview:yanzhengFiled];
    
    UIImageView *lineT = [CommonFunc creatImgeViewRect:CGRectMake(0, yanLab.bottom, mScreenWidth, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [bottomView addSubview:lineT];
    
    
    UILabel * pwdLab = [CommonFunc createLabel:@"输入验证码" FontSize:14 TextColor:[UIColor colorWithHexString:@"4C595D"] Rect:CGRectMake(11, lineT.bottom, 80, 44) Align:NSTextAlignmentLeft];
    [bottomView addSubview:pwdLab];
    
    
    yanzhengFiled = [CommonFunc createTextFieldFrame:CGRectMake(100, pwdLab.top, mScreenWidth - 200, 47) Placeholder:@"请输入验证码" leftView:nil rightView:nil BgImageName:nil font:14];
    yanzhengFiled.delegate = self;
    yanzhengFiled.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [bottomView addSubview:yanzhengFiled];
    
    UIImageView *boIMG = [CommonFunc creatImgeViewRect:CGRectMake((mScreenWidth - 288) / 2, bottomView.bottom + 44, 288, 98) Color:[UIColor clearColor] Img:@"iconghbg" alpha:1];
    [self.view addSubview:boIMG];
    
    getBtn = [CommonFunc createButtonFrame:CGRectMake(mScreenWidth-100, yanLab.top, 100, 44) Title:@"获取验证码" TitleColor:[UIColor colorWithHexString:@"1B8CFF"] font:15 BgColor:[UIColor whiteColor] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(getClick) target:self];
    getBtn.layer.borderColor = [[UIColor colorWithHexString:@"0074FF"]CGColor];
    getBtn.layer.borderWidth = 1.0f;
    
    [bottomView addSubview:getBtn];
    
    
    nextBtn =  [CommonFunc createButtonFrame:CGRectMake(0, mScreenHeight-49-mStatusBarOffset, mScreenWidth, 49) Title:@"找回密码" TitleColor:[UIColor colorWithHexString:@"ffffff"] font:20 BgColor:[UIColor colorWithHexString:@"D4D4D4"] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(findClick:) target:self];
    [self.view addSubview:nextBtn];
}

//定时器
- (void)timeFired:(NSTimer *)timer
{
    if ([self loadCodeTime])
    {
        NSInteger cha = [self  now:[NSDate date] before:[self loadCodeTime]];
        if (cha < TimeFCount)
        {
            getBtn.enabled = NO;
            nextBtn.enabled = NO;
            [getBtn setTitle:[NSString stringWithFormat:@"重发(%@s)",@(TimeFCount - cha)] forState:UIControlStateNormal];
            clewLab.text = @"验证码短信(免费)已发送";
        }
        else
        {
            getBtn.enabled = YES;
            nextBtn.enabled = YES;
            if (TimeFCount - cha == 0)
            {
                [getBtn setTitle:@"重获验证码" forState:UIControlStateNormal];
            }
            clewLab.text = @"获取短信(免费)验证码";
        }
    }
}

#pragma mark 验证码发送保存
- (void)saveCodeTime
{
    [SaveCachesFile saveDataList:[NSDate date] fileName:DateFSave];
}

- (NSDate *)loadCodeTime
{
    return [SaveCachesFile loadDataList:DateFSave];
}

- (NSInteger)now:(NSDate *)now before:(NSDate *)before
{
    NSTimeInterval late = [before timeIntervalSince1970]*1;
    NSTimeInterval nowInt = [now timeIntervalSince1970]*1;
    
    NSTimeInterval cha = nowInt - late;
    return cha;
}

//获取验证码啊
- (void)getClick
{
    //重发计时
    [self saveCodeTime];
    
    
    clewLab.text = @"验证码短信(免费)已发送";
}

- (void)findClick:(UIButton *)sender
{
     //找回密码
    NewSetViewController *newVC = [[NewSetViewController alloc]init];
    [self.navigationController pushViewController:newVC animated:YES];
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
    [cardNum resignFirstResponder];
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
