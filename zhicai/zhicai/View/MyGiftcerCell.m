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
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 0,5, bottomView.height) Color:[UIColor redColor] Img:nil alpha:1];
    [bottomView addSubview:leftIMG];
    
    UILabel *yLab = [CommonFunc createLabel:@"¥" FontSize:14 TextColor:[UIColor redColor] Rect:CGRectMake(20, 62, 10, 15) Align:NSTextAlignmentLeft];
    [bottomView addSubview:yLab];
    
    UILabel *mLab = [CommonFunc createLabel:@"20" FontSize:70 TextColor:[UIColor redColor] Rect:CGRectMake(yLab.right, 14, 91, 70) Align:NSTextAlignmentLeft];
    [bottomView addSubview:mLab];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 89, bottomView.width, 1) Color:[UIColor grayColor] Img:nil alpha:1];
    [bottomView addSubview:lineIMG];
    
    UILabel * termLab = [CommonFunc createLabel:@"使用条件:" FontSize:14 TextColor:[UIColor blackColor] Rect:CGRectMake(141, 30, bottomView.width - 150, 17) Align:NSTextAlignmentLeft];
    [bottomView addSubview:termLab];
    
    UILabel * term = [CommonFunc createLabel:@"投资金额达两千可用" FontSize:14 TextColor:[UIColor blackColor] Rect:CGRectMake(141, termLab.bottom, bottomView.width - 150, 17) Align:NSTextAlignmentLeft];
    [bottomView addSubview:term];
    
    UILabel *timeLab = [CommonFunc createLabel:@"2015-12-02" FontSize:13 TextColor:[UIColor blueColor] Rect:CGRectMake(bottomView.width - 85, lineIMG.bottom, 75, 23) Align:NSTextAlignmentLeft];
    [bottomView addSubview:timeLab];
    
    UILabel *lefTime = [CommonFunc createLabel:@"有效期至：" FontSize:13 TextColor:[UIColor blackColor] Rect:CGRectMake(timeLab.left - 80, timeLab.top, 80, timeLab.height) Align:NSTextAlignmentRight];
    [bottomView addSubview:lefTime];
    
}

- (void)awakeFromNib
{
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
