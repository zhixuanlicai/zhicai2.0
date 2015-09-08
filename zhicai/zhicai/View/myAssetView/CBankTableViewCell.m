//
//  CBankTableViewCell.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "CBankTableViewCell.h"

@implementation CBankTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatViews];
    }
    return self;
}

- (void)creatViews
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 44)];
    view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    [self addSubview:view];
    
    UIImageView *lineImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 43, view.width, 1)];
    lineImg.backgroundColor = [UIColor colorWithHexString:@"D4D4D4"];
    [view addSubview:lineImg];
    
    self.leftIMG = [CommonFunc creatImgeViewRect:CGRectMake(10, (view.height - 20)/2, 20, 20) Color:[UIColor blackColor] Img:nil alpha:1];
    [view addSubview:self.leftIMG];
    
    self.rightIMG = [CommonFunc creatImgeViewRect:CGRectMake(view.width - 20, 14, 20, 16) Color:[UIColor blackColor] Img:nil alpha:1];
    [view addSubview:self.rightIMG];
    
    self.nameLabel = [CommonFunc createLabel:@"工商银行" FontSize:17 TextColor:[UIColor colorWithHexString:@"A6ACAE"] Rect:CGRectMake(self.leftIMG.right+10,12,150,20) Align:NSTextAlignmentLeft];//选中的颜色是4D595D
    [view addSubview:self.nameLabel];
    
    
     
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
