//
//  formContrl.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "formContrl.h"

@implementation formContrl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = frame;
        [self creatViews];
    }
    return self;
}

- (void)creatViews
{
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(10, 20, self.width - 20, 41)];
    topView.backgroundColor = [UIColor redColor];
    [self addSubview:topView];
    
    UILabel *nameLab = [CommonFunc createLabel:@"资产构成" FontSize:20 TextColor:[UIColor blackColor] Rect:CGRectMake(10, 10, 100, 21) Align:NSTextAlignmentLeft];
    [topView addSubview:nameLab];
    
    UIButton *canBtn = [CommonFunc createButtonFrame:CGRectMake(topView.width - 45, 3, 35, 35) Title:@"删" TitleColor:nil BgColor:[UIColor blackColor] BgImageName:nil ImageName:nil SeleImage:nil Method:@selector(cancelAction:) target:self];
    [topView addSubview:canBtn];
    
    UIView *MinView = [[UIView alloc]initWithFrame:CGRectMake((self.width - 270)/2, topView.bottom + 22, 270, 214)];
    MinView.backgroundColor = [UIColor whiteColor];
    [self addSubview:MinView];
    
    
    UIImageView *bluIMG = [CommonFunc creatImgeViewRect:CGRectMake(64, 214, 29, 70) Color:[UIColor blueColor] Img:nil alpha:1];
    [MinView addSubview:bluIMG];
    
    [self MoveViewToView:bluIMG time:1 withX:bluIMG.left Y:214 - bluIMG.height Width:bluIMG.width Height:bluIMG.height alpha:1];
    
    UIImageView *greIMG = [CommonFunc creatImgeViewRect:CGRectMake(bluIMG.right + 33,214, 29, 110) Color:[UIColor greenColor] Img:nil alpha:1];
    [MinView addSubview:greIMG];
    
    [self MoveViewToView:greIMG time:1 withX:greIMG.left Y:214 - greIMG.height Width:greIMG.width Height:greIMG.height alpha:1];
    
    UIImageView *oraIMG = [CommonFunc creatImgeViewRect:CGRectMake(greIMG.right + 33,214, 29, 157) Color:[UIColor orangeColor] Img:nil alpha:1];
    [MinView addSubview:oraIMG];
    
    [self MoveViewToView:oraIMG time:1 withX:oraIMG.left Y:214 - oraIMG.height Width:oraIMG.width Height:oraIMG.height alpha:1];
    
    
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 213, MinView.width, 1) Color:[UIColor blackColor] Img:nil alpha:1];
    [MinView addSubview:lineIMG];
    
    UIView *boView = [[UIView alloc]initWithFrame:CGRectMake(0,lineIMG.bottom, 270, 170)];
    boView.backgroundColor = [UIColor whiteColor];
    [MinView addSubview:boView];
    
    NSLog(@"selg.topView %f %f %f",topView.top,MinView.top,MinView.top);
}

- (void)MoveViewToView:(UIView*)view  time:(NSTimeInterval)time withX:(CGFloat)X Y:(CGFloat)Y Width:(CGFloat)width Height:(CGFloat)height alpha:(CGFloat)alpha
{
    [UIView animateWithDuration:time animations:^{
        view.frame = CGRectMake(X, Y, width, height);
    } completion:^(BOOL finished) {
        view.alpha = alpha;
    }];
}

- (void)cancelAction:(UIButton *)sender
{
    [self.delegate deleContrlDelegate];
}

@end
