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
    topView.backgroundColor = [UIColor colorWithHexString:@"EDECE9"];

    [self creatMoveLayer:topView color:topView.backgroundColor floatO:6.0 floatT:0.5];
    
    [self addSubview:topView];
    
    UILabel *nameLab = [CommonFunc createLabel:@"资产构成" FontSize:18 TextColor:[UIColor colorWithHexString:@"727272"] Rect:CGRectMake(11, 10, 100, 21) Align:NSTextAlignmentLeft];
    [topView addSubview:nameLab];
    
    UIButton *canBtn = [CommonFunc createButtonFrame:CGRectMake(topView.width - 46, 3, 35, 35) Title:@"" TitleColor:nil font:15 BgColor:nil BgImageName:nil ImageName:@"dssxz" SeleImage:nil Method:@selector(cancelAction:) target:self];
    [topView addSubview:canBtn];
    
    UIView *MinView = [[UIView alloc]initWithFrame:CGRectMake((self.width - 270)/2, topView.bottom + 22, 270, 214)];
    MinView.backgroundColor = [UIColor whiteColor];
    [self addSubview:MinView];
    
    
    UIImageView *bluIMG = [CommonFunc creatImgeViewRect:CGRectMake(64, 214, 29, 70) Color:[UIColor colorWithHexString:@"658EC9"] Img:nil alpha:1];
    [MinView addSubview:bluIMG];
    
    [self MoveViewToView:bluIMG time:1 withX:bluIMG.left Y:214 - bluIMG.height Width:bluIMG.width Height:bluIMG.height alpha:1];
    
    UIImageView *greIMG = [CommonFunc creatImgeViewRect:CGRectMake(bluIMG.right + 33,214, 29, 110) Color:[UIColor colorWithHexString:@"70C288"] Img:nil alpha:1];
    [MinView addSubview:greIMG];
    
    [self MoveViewToView:greIMG time:1 withX:greIMG.left Y:214 - greIMG.height Width:greIMG.width Height:greIMG.height alpha:1];
    
    UIImageView *oraIMG = [CommonFunc creatImgeViewRect:CGRectMake(greIMG.right + 33,214, 29, 157) Color:[UIColor colorWithHexString:@"F59274"] Img:nil alpha:1];
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

- (void)creatMoveLayer:(UIView *)view color:(UIColor *)color floatO:(CGFloat)one floatT:(CGFloat)two
{
    view.layer.masksToBounds = YES;
     // 设置圆角角度
    view.layer.cornerRadius = one;
    // 圆角描边线的宽度
    view.layer.borderWidth = two;
    // 圆角描边线的颜色
    view.layer.borderColor = [color CGColor];
}

- (void)cancelAction:(UIButton *)sender
{
    [self.delegate deleContrlDelegate];
}

@end
