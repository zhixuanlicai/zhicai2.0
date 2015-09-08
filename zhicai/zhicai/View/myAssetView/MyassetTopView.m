//
//  MyassetTopView.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "MyassetTopView.h"

@implementation MyassetTopView

-(instancetype)initWithFrame:(CGRect)frame IMGName:(NSString *)imgName
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.dataModel = imgName;
        [self creatSubViews];
    }
    return self;
}

#pragma mark 创建视图
- (void)creatSubViews
{
    UIView *bView = [[UIView alloc]initWithFrame:self.bounds];
    bView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bView];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(11, bView.bottom - 1, mScreenWidth-11, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.1];
    [self addSubview:lineIMG];
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(11,(bView.height - 24)/2, 24, 24)  Color:[UIColor clearColor] Img:self.dataModel alpha:1];
    
    NSLog(@"self .da %@",self.dataModel);
    [self addSubview:leftIMG];
    
    UILabel *nameLab = [CommonFunc createLabel:@"代金券" FontSize:14 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(leftIMG.right + 10,leftIMG.top,100,20) Align:NSTextAlignmentLeft];
    [self addSubview:nameLab];
    
    UILabel *numLab = [CommonFunc createLabel:@"20" FontSize:18 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(mScreenWidth - 70 , leftIMG.top, 50, 20) Align:NSTextAlignmentRight];
    [self addSubview:numLab];
}

@end
