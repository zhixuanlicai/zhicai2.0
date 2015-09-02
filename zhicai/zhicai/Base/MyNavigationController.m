

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

//当导航控制器的view创建完毕调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTintColor:[UIColor colorWithHexString:@"ff8400"]];
}

//当第一次使用这个类的时候调用一次
+ (void)initialize
{
    [self setupNavigationBarTheme];
    [self setupUIBarButtonItemTheme];
}

//设置UINavigationBar的主题
+ (void)setupNavigationBarTheme
{
    //通过appearance对象能修改整个项目中所有UINavigationBar的样式
    UINavigationBar * appearance = [UINavigationBar appearance];
    //设置导航栏背景
    [appearance setBackgroundColor:[UIColor colorWithHexString:@"0074FF"]];
    //设置文字属性
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeFont] = [UIFont fontWithName:@"STHeitiSC-Light" size:18.0];
    textAttrs[UITextAttributeTextColor] = [UIColor colorWithHexString:@"3a3a3a"];
    //UIOffsetZero是结构体，只能包装成对象才能放在字典中
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs];
}

//设置UIBarButtonItem的主题
+ (void)setupUIBarButtonItemTheme
{
    UIBarButtonItem * appearance = [UIBarButtonItem appearance];
    //设置普通状态的文字属性
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeFont] = [UIFont fontWithName:@"STHeitiSC-Light" size:15.0];
    textAttrs[UITextAttributeTextColor] = [UIColor colorWithHexString:@"3a3a3a"];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置高亮状态的文字属性
    NSMutableDictionary * highextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    [appearance setTitleTextAttributes:highextAttrs forState:UIControlStateHighlighted];
    
    //设置不可用状态的文字属性
    NSMutableDictionary * disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[UITextAttributeTextColor] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    //背景
    //技巧：(做一张完全透明或与导航栏颜色一样的图片，为让某个按钮的背景图片消失)
    //    [appearance setBackgroundImage:[UIImage imageNamed:@"imagename"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    NSInteger countOfViewControllers = self.viewControllers.count;
    while (countOfViewControllers > 0) {
        
        [self popViewControllerAnimated:NO];
        countOfViewControllers--;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
