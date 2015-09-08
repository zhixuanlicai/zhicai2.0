//
//  BankTableViewCell.h
//  zhicai
//
//  Created by D on 15/9/6.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BankTableViewCellDelegate <NSObject>

- (void)deleBankCard:(NSString *)model;

@end

@interface BankTableViewCell : UITableViewCell

@property (nonatomic, strong)  UIView *bottomView;

@property (nonatomic, strong) UIButton *delBtn;

@property (nonatomic, strong) NSString *Model;

@property (nonatomic, strong) id<BankTableViewCellDelegate>delegate;

- (void)getBankCarModel:(NSString *)model;


@end
