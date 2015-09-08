//
//  Commondef.h
//  zhicai
//
//  Created by 陈思思 on 15/9/1.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#ifndef zhicai_Commondef_h
#define zhicai_Commondef_h

#define kLoginUserName @"LoginUserName"
#define kLoginTokenIdentifier @"LoginToken"
#define kIsLogin @"IsLogin"
#define kStatusBarHeight (([[[UIDevice currentDevice] systemVersion] floatValue] < 7) ? 40 : 64)
#define mTabBarHeight 49
#define kToolTabHeight  44

#define APPDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define mScreenWidth [[UIScreen mainScreen] bounds].size.width
#define mScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define mStatusBarOffset 64 //(([[[UIDevice currentDevice] systemVersion] floatValue] < 7) ? 64 : 64)
#define kStatusBarHeight (([[[UIDevice currentDevice] systemVersion] floatValue] < 7) ? 40 : 64)
#define mTabBarHeight 49
#define kToolTabHeight  44
#define mCircleDiameter (IS_IPHONE6PLUS ? 72 : (60 * mWidthPercentageWith5s))
#define mWidthPercentageWith5s (mScreenWidth / 320)
#define mHeightPercentageWith5s (mScreenHeight / 568)
#define kHttpConnectionTimeoutSec 60

#endif
