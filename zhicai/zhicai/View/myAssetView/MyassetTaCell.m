//
//  MyassetTaCell.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "MyassetTaCell.h"

@implementation MyassetTaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatViewSubViews];
    }
    return  self;
}

- (void)creatViewSubViews
{
    UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 90)];
    [self addSubview:mainView];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 60)];
    topView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:topView];
    
    //名字
    UILabel *nameLab = [CommonFunc createLabel:@"智选天下5期" FontSize:15 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(11,5, mScreenWidth/3 - 11, 50) Align:NSTextAlignmentLeft];
    [topView addSubview:nameLab];
    
    //投资金额
    UILabel *mNLab = [CommonFunc createLabel:@"投资金额(元)" FontSize:11 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(nameLab.right,10,mScreenWidth/3, 15) Align:NSTextAlignmentCenter];
    [topView addSubview:mNLab];
    
    NSString *str = [CommonFunc  numFormatMoney:50000 numberStyle:NSNumberFormatterCurrencyStyle];//NSNumberFormatterPercentStyle
    UILabel *mLab = [CommonFunc createLabel:str FontSize:15 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(mNLab.left,25,mScreenWidth/3, 20) Align:NSTextAlignmentCenter];
    [topView addSubview:mLab];
    
    //预期年化收益
    
    UILabel *exLab = [CommonFunc createLabel:@"预期年化收益" FontSize:11 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(mNLab.right,10,mScreenWidth/3, 15) Align:NSTextAlignmentCenter];
    [topView addSubview:exLab];
    
    UILabel *eMLab = [CommonFunc createLabel:[NSString stringWithFormat:@"%.2f%@",(float)10,@"%"] FontSize:15 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(exLab.left,25,mScreenWidth/3, 20) Align:NSTextAlignmentCenter];
    [topView addSubview:eMLab];
   
    
    UIImageView *lineIMG = [CommonFunc  creatImgeViewRect:CGRectMake(10, topView.height - 1, mScreenWidth - 10, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.1];
    [topView addSubview:lineIMG];
    
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(0, topView.bottom, mScreenWidth, 24)];
    bView.backgroundColor  = [UIColor whiteColor];
    [mainView addSubview:bView];
    
    
    //时间
    UILabel *timeLab = [CommonFunc createLabel:@"2015.07.03—2015.09.03" FontSize:11 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(11, 6, mScreenWidth/3 + 20, 12) Align:NSTextAlignmentLeft];
    [bView addSubview:timeLab];
    //投资期限
    UILabel * limitLab = [CommonFunc createLabel:@"投资期限90天" FontSize:11 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(timeLab.right, 6, mScreenWidth/3 - 20, 12) Align:NSTextAlignmentLeft];
    [bView addSubview:limitLab];
    
    //预计收益天数
    UILabel * exTLab = [CommonFunc createLabel:@"预计收益35天" FontSize:11 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(limitLab.right, 6, mScreenWidth/3 - 10, 12) Align:NSTextAlignmentCenter];
    [bView addSubview:exTLab];
    
    UIImageView *bIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, bView.bottom, mScreenWidth, 5) Color:[UIColor clearColor] Img:nil alpha:.1];
    [mainView addSubview:bIMG];
    
}

- (void)awakeFromNib
{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
