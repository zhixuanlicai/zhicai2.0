//
//  MygiftcerTableViewCell.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "MyGiftcerCell.h"

@implementation MyGiftcerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
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
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(18, 10, mScreenWidth - 36, 112)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
    UIImageView *bgImg = [CommonFunc creatImgeViewRect:CGRectMake(0, 0, bottomView.width, bottomView.height) Color:nil Img:@"atdrgfrc" alpha:1];
    [bottomView addSubview:bgImg];
    
    UILabel *yLab = [CommonFunc createLabel:@"¥" FontSize:15 TextColor:[UIColor colorWithHexString:@"F05E51"] Rect:CGRectMake(20, 65, 10, 15) Align:NSTextAlignmentLeft];
    [bottomView addSubview:yLab];
    
    UILabel *mLab = [CommonFunc createLabel:@"20" FontSize:80 TextColor:[UIColor colorWithHexString:@"F05E51"] Rect:CGRectMake(yLab.right, 10, 91, 80) Align:NSTextAlignmentLeft];
    [bottomView addSubview:mLab];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(5, 89, bottomView.width - 5, 1) Color:[UIColor grayColor] Img:nil alpha:1];
    [bottomView addSubview:lineIMG];
    
    UILabel * termLab = [CommonFunc createLabel:@"使用条件:" FontSize:12 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(141, 35, bottomView.width - 150, 16) Align:NSTextAlignmentLeft];
    [bottomView addSubview:termLab];
    
    UILabel * term = [CommonFunc createLabel:@"投资金额达两千可用" FontSize:12 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(141, termLab.bottom, bottomView.width - 150, 17) Align:NSTextAlignmentLeft];
    [bottomView addSubview:term];
    
    UILabel *timeLab = [CommonFunc createLabel:@"2015-12-02" FontSize:11 TextColor:[UIColor colorWithHexString:@"0073FF"] Rect:CGRectMake(bottomView.width - 85, lineIMG.bottom, 75, 23) Align:NSTextAlignmentLeft];
    [bottomView addSubview:timeLab];
    
    UILabel *lefTime = [CommonFunc createLabel:@"有效期至：" FontSize:13 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(timeLab.left - 80, timeLab.top, 80, timeLab.height) Align:NSTextAlignmentRight];
    [bottomView addSubview:lefTime];
    
    //如果过期所有颜色均改为#A6ACAE 时间变为已过期 有效期隐藏
    
}

- (void)awakeFromNib
{
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
