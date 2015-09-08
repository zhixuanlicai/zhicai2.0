//
//  formContrl.h
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol formContrlDelegate <NSObject>

- (void)deleContrlDelegate;

@end

@interface formContrl : UIView

@property (nonatomic, strong) id<formContrlDelegate>delegate;

@end
