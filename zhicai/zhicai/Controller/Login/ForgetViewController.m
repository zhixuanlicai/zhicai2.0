//
//  ForgetViewController.m
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()

@end

@implementation ForgetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"忘记密码";
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
