//
//  formContrl.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "formContrl.h"

//#define MAXNUM(a,b,c) (a>b?(a>c?a:c):(b>c?b:c))

@implementation formContrl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = frame;
        [self creatViews];
        
//        NSInteger A = 12;
//        NSInteger B = 23;
//        NSInteger C = 24;
//        
//        NSLog(@"max %@",@(MAXNUM(12, 23,24)));
//        if (C == MAXNUM(12, 23, 24))
//        {
//            NSLog(@"B C %@ %@",@(A),@(B));
//        }
//       
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
    
    //最高的高度是178
    
    UIImageView *bluIMG = [CommonFunc creatImgeViewRect:CGRectMake(64, 214, 30, 70) Color:[UIColor colorWithHexString:@"658EC9"] Img:nil alpha:1];
    [MinView addSubview:bluIMG];
    
    [self MoveViewToView:bluIMG time:1 withX:bluIMG.left Y:214 - bluIMG.height Width:bluIMG.width Height:bluIMG.height alpha:1];
    
    UIImageView *greIMG = [CommonFunc creatImgeViewRect:CGRectMake(bluIMG.right + 33,214, 30, 110) Color:[UIColor colorWithHexString:@"70C288"] Img:nil alpha:1];
    [MinView addSubview:greIMG];
    
    [self MoveViewToView:greIMG time:1 withX:greIMG.left Y:214 - greIMG.height Width:greIMG.width Height:greIMG.height alpha:1];
    
    UIImageView *oraIMG = [CommonFunc creatImgeViewRect:CGRectMake(greIMG.right + 33,214, 30, 157) Color:[UIColor colorWithHexString:@"F59274"] Img:nil alpha:1];
    [MinView addSubview:oraIMG];
    
    [self MoveViewToView:oraIMG time:1 withX:oraIMG.left Y:214 - oraIMG.height Width:oraIMG.width Height:oraIMG.height alpha:1];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 213, MinView.width, 1) Color:[UIColor blackColor] Img:nil alpha:1];
    [MinView addSubview:lineIMG];
    
    UIView *boView = [[UIView alloc]initWithFrame:CGRectMake(0,lineIMG.bottom, 270, 170)];
    boView.backgroundColor = [UIColor whiteColor];
    [MinView addSubview:boView];
    
    [boView addSubview:[self addViewToBoView:CGRectMake(0, 40, boView.width, 30) color:[UIColor colorWithHexString:@"658EC9"] name:@"昨日收益" money:[NSString stringWithFormat:@"%.2f",2.5]]];
    
    [boView addSubview:[self addViewToBoView:CGRectMake(0, 70, boView.width, 30) color:[UIColor colorWithHexString:@"70C288"] name:@"总收益" money:[NSString stringWithFormat:@"%.2f",232.5]]];
    
    [boView addSubview:[self addViewToBoView:CGRectMake(0, 100, boView.width, 30) color:[UIColor colorWithHexString:@"F59274"] name:@"总资产" money:[NSString stringWithFormat:@"%.2f",1232.5]]];
    
    
    NSLog(@"selg.topView %f %f %f",topView.top,MinView.top,MinView.top);
}

- (UIView *)addViewToBoView:(CGRect)rect color:(UIColor *)color name:(NSString *)name money:(NSString*)money
{
    UIView *view  = [[UIView alloc]initWithFrame:rect];
    
    UIImageView *lefIMG = [CommonFunc creatImgeViewRect:CGRectMake(35, 8, 15, 15) Color:color Img:nil alpha:1];
    [self creatMoveLayer:lefIMG color:color floatO:2.0 floatT:0.5];
    [view addSubview:lefIMG];
    
    UILabel *label = [CommonFunc createLabel:name FontSize:14 TextColor:[UIColor colorWithHexString:@"727272"] Rect:CGRectMake(lefIMG.right + 10, 5, 70, 20) Align:NSTextAlignmentLeft];
    [view addSubview:label];
    
    UILabel *mLabel = [CommonFunc createLabel:[NSString stringWithFormat:@"¥%@",money] FontSize:14 TextColor:[UIColor colorWithHexString:@"727272"] Rect:CGRectMake(label.right + 10, 5, 100, 20) Align:NSTextAlignmentLeft];
    [view addSubview:mLabel];
    
    return view;
}

- (void)MoveViewToView:(UIView*)view  time:(NSTimeInterval)time withX:(CGFloat)X Y:(CGFloat)Y Width:(CGFloat)width Height:(CGFloat)height alpha:(CGFloat)alpha
{
    [self creatMoveLayer:view color:view.backgroundColor floatO:3.0 floatT:0.5];

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
