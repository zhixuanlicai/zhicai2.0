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

- (void)getBankCarModel:(NSString *)model
{
}

- (void)creatSubViews
{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(20, 10, mScreenWidth - 40, 165)];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bottomView];
    
    UIImageView *leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(20, 20, 26, 26) Color:[UIColor grayColor] Img:nil alpha:1];
    [self.bottomView addSubview:leftIMG];
    
    UILabel *bNameLab = [CommonFunc createLabel:@"招商银行" FontSize:20 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(leftIMG.right + 6, leftIMG.top + 2,150, 25) Align:NSTextAlignmentLeft];
    [self.bottomView addSubview:bNameLab];
    
    UILabel *nLab = [CommonFunc createLabel:@"姓名：张三" FontSize:12 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(25, 60, 100, 20) Align:NSTextAlignmentLeft];
    [self.bottomView addSubview:nLab];
    
    UIImageView *lineIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 95, self.bottomView.width, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [self.bottomView addSubview:lineIMG];
    
    UIImageView *lineTIMG = [CommonFunc creatImgeViewRect:CGRectMake(0, 135, self.bottomView.width, 1) Color:[UIColor colorWithHexString:@"D4D4D4"] Img:nil alpha:1];
    [self.bottomView addSubview:lineTIMG];
    
    UILabel *numLabel = [CommonFunc createLabel:@"**** **** **** **** 7750" FontSize:20 TextColor:[UIColor colorWithHexString:@"4D595D"] Rect:CGRectMake(25, lineIMG.bottom, self.bottomView.width - 50,35) Align:NSTextAlignmentRight];
    [self.bottomView addSubview:numLabel];
    
}

- (void)delAction:(UIButton *)sender
{
    [self.delegate deleBankCard:self.Model];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
