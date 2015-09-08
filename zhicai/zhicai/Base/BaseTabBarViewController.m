//
//  TabBarViewController.m
//  zhicai
//
//  Created by D on 15/9/7.
//  Copyright (c) 2015年 zhicai. All rights reserved.
//

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 创建页面
    [self createViewControllers];
    //创建item属性
    [self createItems];
    
}
- (void)createViewControllers
{
    
//    SaleViewController * vc1 = [[SaleViewController alloc]init];
//    UINavigationController * nc1 = [[UINavigationController alloc]initWithRootViewController:vc1];
//    vc1.navigationItem.title = @"特卖推荐";
//    vc1.tabBarItem.tag = 100;
    
    
    // 理财产品
//    productViewController * vc2 = [[productViewController alloc]init];
//    UINavigationController * nc2 = [[UINavigationController alloc]initWithRootViewController:vc2];
//    vc2.navigationItem.title = @"理财产品";
//    vc2.tabBarItem.tag = 101;
    
    //我的资产
//    MyMoneyViewController * vc3 = [[MyMoneyViewController alloc]init];
//    
//    UINavigationController * nc3 = [[UINavigationController alloc]initWithRootViewController:vc3];
//    vc3.navigationItem.title = @"我的资产";
//    vc3.tabBarItem.tag = 102;
//    
//    // 更多
//    MoreViewController * vc4 = [[MoreViewController alloc]init];
//    UINavigationController * nc4 = [[UINavigationController alloc]initWithRootViewController:vc4];
//    vc4.navigationItem.title = @"更多";
//    vc4.tabBarItem.tag = 103;
//    self.viewControllers = @[nc1,nc2,nc3,nc4];
    
    //    UIView * tabView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MRScreenWidth, 49)];
    //    tabView.backgroundColor = [UIColor redColor];
    //    [self.tabBarController.tabBar insertSubview:tabView atIndex:0];
    //    self.tabBarController.tabBar.opaque = YES;
    
}

- (void)createItems
{
    NSArray * titleArr = @[@"特卖推荐",@"理财产品",@"我的资产",@"更多"];
    NSArray * selectedImgArr =@[@"tabbarsaleClick.png",@"tabbarBuyClick.png",@"tabbarmonyClick.png",@"tabbargenClick.png"];
    NSArray * unSelectedImgArr = @[@"tabbarsale.png",@"tabbarBuy.png",@"tabbarmony.png",@"tabbargen.png"];
    for (int i = 0; i<self.tabBar.items.count; i++)
    {
        UITabBarItem * item = self.tabBar.items[i];
        // 对图片进行处理
        if (/* DISABLES CODE */ (1))
        {
            UIImage * selectedImage = [UIImage imageNamed:selectedImgArr[i]];
            selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIImage * unSelectedImage = [UIImage imageNamed:unSelectedImgArr[i]];
            unSelectedImage = [unSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            // 上面是为了防止显示阴影而不是显示图片
            item.selectedImage = selectedImage;
            item.image = unSelectedImage;
            item.title = titleArr[i];
            
        }
        else
        {
            [item setFinishedSelectedImage:[UIImage imageNamed:selectedImgArr[i]] withFinishedUnselectedImage:[UIImage imageNamed:unSelectedImgArr[i]]];
        }
    }
    
    if (/* DISABLES CODE */ (1))
    {
        [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRGBHex:0x509ef0] } forState:UIControlStateSelected];
    }
    else
    {
        
        [[UIBarButtonItem appearance]setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor colorWithRGBHex:0x509ef0]} forState:UIControlStateSelected];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
