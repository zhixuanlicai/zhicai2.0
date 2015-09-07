//
//  BankTableViewCell.m
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "BankTableViewCell.h"

@implementation BankTableViewCell

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
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(20, 10, mScreenWidth - 40, 165)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(20, 20, 27, 27) Color:[UIColor grayColor] Img:nil alpha:1];
    [bottomView addSubview:leftIMG];
    
    UILabel *bNameLab = [CommonFunc createLabel:@"招商银行" FontSize:23 TextColor:[UIColor blackColor] Rect:CGRectMake(leftIMG.right + 6, leftIMG.top + 2,150, 25) Align:NSTextAlignmentLeft];
    [bottomView addSubview:bNameLab];
    
    UILabel *nLab = [CommonFunc createLabel:@"姓名：张三" FontSize:15 TextColor:[UIColor blackColor] Rect:CGRectMake(25, 60, 100, 20) Align:NSTextAlignmentLeft];
    [bottomView addSubview:nLab];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 95, bottomView.width, 1) Color:[UIColor lightGrayColor] Img:nil alpha:1];
    [bottomView addSubview:lineIMG];
    
    UIImageView *lineTIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 135, bottomView.width, 1) Color:[UIColor lightGrayColor] Img:nil alpha:1];
    [bottomView addSubview:lineTIMG];
    
    UILabel *numLabel = [CommonFunc createLabel:@"**** **** **** **** 7750" FontSize:23 TextColor:[UIColor blackColor] Rect:CGRectMake(25, lineIMG.bottom, bottomView.width - 50,35) Align:NSTextAlignmentRight];
    [bottomView addSubview:numLabel];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
