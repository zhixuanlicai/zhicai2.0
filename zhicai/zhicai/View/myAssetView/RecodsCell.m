//
//  RecodsCell.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "RecodsCell.h"

@implementation RecodsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatSubViews];
    }
    return self;
}

- (void)creatSubViews
{
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 75)];
    baseView.backgroundColor = [UIColor whiteColor];
    [self addSubview:baseView];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 74, mScreenWidth, 1) Color:[UIColor lightGrayColor] Img:nil alpha:.5];
    [baseView addSubview:lineIMG];
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(11, 26, 23, 23) Color:[UIColor clearColor] Img:@"xtuibiao" alpha:1];
    [baseView addSubview:leftIMG];
    
    UIImageView *rightIMG = [CommonFunc creatImgeViewRect:CGRectMake(baseView.width - 22, 29, 11, 17) Color:[UIColor clearColor] Img:@"dsfcsdxz" alpha:1];
    [baseView addSubview:rightIMG];
    
    //交易状态
    UILabel *tyLab = [CommonFunc createLabel:@"交易成功" FontSize:15 TextColor:[UIColor  colorWithHexString:@"4C595D"] Rect:CGRectMake(leftIMG.right + 11,19,100,16) Align:NSTextAlignmentLeft];
    [baseView addSubview:tyLab];
    
    //名称
    UILabel *nameLab = [CommonFunc createLabel:@"智选天下1期" FontSize:12 TextColor:[UIColor  colorWithHexString:@"878787"] Rect:CGRectMake(tyLab.left,tyLab.bottom + 5,150,22) Align:NSTextAlignmentLeft];
    [baseView addSubview:nameLab];
    
    //金额
    NSString *str = [CommonFunc  numFormatMoney:100 numberStyle:NSNumberFormatterCurrencyStyle];
    UILabel *mLab = [CommonFunc createLabel:str FontSize:15 TextColor:[UIColor  colorWithHexString:@"4C595D"] Rect:CGRectMake(rightIMG.left - 211,tyLab.top,200,16) Align:NSTextAlignmentRight];
    [baseView addSubview:mLab];
    
    
    //时间
    UILabel *tLab = [CommonFunc createLabel:@"2015-03-05 15:24:20" FontSize:12 TextColor:[UIColor  colorWithHexString:@"4C9DFF"] Rect:CGRectMake(nameLab.right,tyLab.bottom + 5,150,22) Align:NSTextAlignmentRight];
    [baseView addSubview:tLab];
}

- (void)awakeFromNib {
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
