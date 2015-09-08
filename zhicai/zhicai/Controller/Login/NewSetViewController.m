//
//  NewSetViewController.m
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "NewSetViewController.h"

@interface NewSetViewController ()

@end

@implementation NewSetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [CommonFunc backBarButtonItemTarget:self action:@selector(backBtnAction:)];
    
    
    self.title = @"重置密码";
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

 

@end
