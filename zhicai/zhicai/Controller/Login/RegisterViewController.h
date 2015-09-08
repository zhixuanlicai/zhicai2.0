//
//  RegisterViewController.h
//  zhicai
//
//  Created by D on 15/9/8.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "BaseViewController.h"

#define TimeCount 60

#define DateSave @"DateSave"
#define CodeSave @"CodeSave"

@interface RegisterViewController : BaseViewController

@property (nonatomic , strong) NSTimer *codeTimer;

@end
