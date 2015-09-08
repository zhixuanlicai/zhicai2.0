#import "HomeViewController.h"
#import "Masonry.h"
#import "ADTickerLabel.h"
#import "ListViewController.h"
#define ViewBorder 11
@interface HomeViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIView *V1;
    UIView *V2;
    UIView *V3;
}

@property (nonatomic, strong) ADTickerLabel *tickerLabel;
@property (nonatomic, strong) ADTickerLabel *tickerLabel1;
@property (nonatomic, strong) NSArray *numbersArray;
@property (nonatomic, strong) NSArray *numbersArray1;
@property (nonatomic, unsafe_unretained) NSInteger currentIndex;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) NSTimer *timer1;


@property (nonatomic,strong) UILabel *startMoneyLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:235/255.f green:235/255.f blue:240/255.f alpha:1];
    
    //self.navigationController.navigationBarHidden = YES;
    
    [self createNav];
    [self createAdvert];
    [self animationView];
    [self createButtom];
}

//设置导航栏
-(void)createNav
{
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 64)];
    navView.backgroundColor = [UIColor colorWithRed:11/255.f green:89/255.f blue:253/255.f alpha:1];
    [self.view addSubview:navView];
    
    //标题
    UILabel *navLabel = [UILabel new];
    [navView addSubview:navLabel];
    [navLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(navView).with.offset(100);
        make.right.mas_equalTo(navView).with.offset(-100);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(navView).with.offset(-10);
        make.top.mas_equalTo(navView).with.offset(20);
    }];
    
    navLabel.textColor = [UIColor whiteColor];
    navLabel.font = [UIFont boldSystemFontOfSize:20];
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.text = @"直选理财";
    
    
    //消息
    UIButton *informationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [navView addSubview:informationBtn];
    
    [informationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(navView).with.offset(ViewBorder);
        make.top.mas_equalTo(navLabel).with.offset(5);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
        
    }];
    [informationBtn setBackgroundImage:[UIImage imageNamed:@"gvhdgdkj"] forState:UIControlStateNormal];
    [informationBtn addTarget:self action:@selector(informationClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [navView addSubview:setBtn];
    
    [setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(navView).with.offset(-ViewBorder);
        make.top.mas_equalTo(informationBtn).with.offset(5);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
        
    }];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"gvhbnkj"] forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(setClick) forControlEvents:UIControlEventTouchUpInside];
    
}

//设置广告栏
-(void)createAdvert
{
    
    
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake(mScreenWidth *2, 0);
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(self.view);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(170);
        if (iPhone4) {
            make.height.mas_equalTo(120);
        }
    }];
    _scrollView.backgroundColor = [UIColor redColor];
    
    for (int index = 0; index<2; index++) {
        
        UIImageView *advertView = [[UIImageView alloc] initWithFrame:CGRectMake(mScreenWidth * index, _scrollView.frame.size.height, mScreenWidth, 170)];
        //    advertView.image = [UIImage imageNamed:@""];
        
        advertView.backgroundColor = [UIColor orangeColor];
        [_scrollView addSubview:advertView];
    }
    
    // 1.添加圆点
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = 2;
    pageControl.tag = 100;
    //当前圆点
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(_scrollView).with.offset(-20);
        make.bottom.mas_equalTo(_scrollView).with.offset(-5);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(10);
    }];
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:142/255.f green:149/255.f blue:149/255.f alpha:1.0];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:100];
    int pageInt = (int)(_scrollView.contentOffset.x / mScreenWidth + 0.5);
    page.currentPage = pageInt;
}


//动画
-(void)animationView
{
    
    [self addSubViewsToBoView];
    [self addSubviewsToTopView:V1 view:V2 view:V3];
    [self rateNumChange];
    
}

//添加三个拱形图
- (void)addSubViewsToBoView
{
    
    if (iPhone5 | iPhone5S ) {
        
        V1 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight , mScreenWidth, 100)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:V1.bounds];
        img1.image = [UIImage imageNamed:@"zuiwai"];
        [V1 addSubview:img1];
        [self.view addSubview:V1];
        
        // [self addLabelToV1];
        
        [self MoveViewToView:V1 time:1 withX:0 Y:mScreenHeight - 300 Width:mScreenWidth+20 Height:100 alpha:1];
        
        V2 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight + 200, mScreenWidth, 100)];
        V2.backgroundColor = [UIColor clearColor];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:V2.bounds];
        
        img2.image = [UIImage imageNamed:@"zhong"];
        //    V4.backgroundColor = [UIColor blueColor];
        [V2 addSubview:img2];
        [self.view addSubview:V2];
        
        [self MoveViewToView:V2 time:1 withX:0 Y:mScreenHeight - 240 Width:mScreenWidth+20 Height:100 alpha:1];
        V3 = [[UIView alloc]initWithFrame:CGRectMake(0,mScreenHeight + 400, mScreenWidth, 180)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:V3.bounds];
        
        img3.image = [UIImage imageNamed:@"sfdcxfcx"];
        [V3 addSubview:img3];
        [self.view addSubview:V3];
        [self MoveViewToView:V3 time:1 withX:0 Y:mScreenHeight - 180 Width:mScreenWidth Height:230 alpha:1];
    }else if (iphone6)
    {
        
        V1 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight , mScreenWidth, 100)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:V1.bounds];
        img1.image = [UIImage imageNamed:@"zuiwai"];
        [V1 addSubview:img1];
        [self.view addSubview:V1];
        
        // [self addLabelToV1];
        
        [self MoveViewToView:V1 time:1 withX:0 Y:mScreenHeight - 380 Width:mScreenWidth Height:100 alpha:1];
        
        V2 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight + 200, mScreenWidth, 100)];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:V2.bounds];
        
        img2.image = [UIImage imageNamed:@"zhong"];
        //    V4.backgroundColor = [UIColor blueColor];
        [V2 addSubview:img2];
        [self.view addSubview:V2];
        
        [self MoveViewToView:V2 time:1 withX:0 Y:mScreenHeight - 290 Width:mScreenWidth Height:100 alpha:1];
        V3 = [[UIView alloc]initWithFrame:CGRectMake(0,mScreenHeight + 400, mScreenWidth, 200)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:V3.bounds];
        
        img3.image = [UIImage imageNamed:@"sfdcxfcx"];
        [V3 addSubview:img3];
        [self.view addSubview:V3];
        [self MoveViewToView:V3 time:1 withX:0 Y:mScreenHeight - 200 Width:mScreenWidth Height:200 alpha:1];
        
    }else if (iPhone4)
    {
        
        V1 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight , mScreenWidth, 100)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:V1.bounds];
        img1.image = [UIImage imageNamed:@"zuiwai"];
        [V1 addSubview:img1];
        [self.view addSubview:V1];
        
        // [self addLabelToV1];
        
        [self MoveViewToView:V1 time:1 withX:0 Y:mScreenHeight - 270 Width:mScreenWidth Height:100 alpha:1];
        
        V2 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight + 200, mScreenWidth, 100)];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:V2.bounds];
        
        img2.image = [UIImage imageNamed:@"zhong"];
        //    V4.backgroundColor = [UIColor blueColor];
        [V2 addSubview:img2];
        [self.view addSubview:V2];
        
        [self MoveViewToView:V2 time:1 withX:0 Y:mScreenHeight - 210 Width:mScreenWidth Height:100 alpha:1];
        V3 = [[UIView alloc]initWithFrame:CGRectMake(0,mScreenHeight + 400, mScreenWidth, 180)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:V3.bounds];
        
        img3.image = [UIImage imageNamed:@"sfdcxfcx"];
        [V3 addSubview:img3];
        [self.view addSubview:V3];
        [self MoveViewToView:V3 time:1 withX:0 Y:mScreenHeight - 150 Width:mScreenWidth+40 Height:180 alpha:1];
        
    }else
    {
        V1 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight , mScreenWidth, 100)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:V1.bounds];
        img1.image = [UIImage imageNamed:@"zuiwai"];
        [V1 addSubview:img1];
        [self.view addSubview:V1];
        
        // [self addLabelToV1];
        
        [self MoveViewToView:V1 time:1 withX:0 Y:mScreenHeight - 450 Width:mScreenWidth Height:100 alpha:1];
        
        V2 = [[UIView alloc]initWithFrame:CGRectMake(0, mScreenHeight + 200, mScreenWidth, 100)];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:V2.bounds];
        
        img2.image = [UIImage imageNamed:@"zhong"];
        [V2 addSubview:img2];
        [self.view addSubview:V2];
        
        [self MoveViewToView:V2 time:1 withX:0 Y:mScreenHeight - 360 Width:mScreenWidth Height:100 alpha:1];
        V3 = [[UIView alloc]initWithFrame:CGRectMake(0,mScreenHeight + 400, mScreenWidth, 280)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:V3.bounds];
        
        img3.image = [UIImage imageNamed:@"sfdcxfcx"];
        [V3 addSubview:img3];
        [self.view addSubview:V3];
        [self MoveViewToView:V3 time:1 withX:0 Y:mScreenHeight - 260 Width:mScreenWidth+150 Height:280 alpha:1];
    }
    
    
    
    
}



//添加四个运动图
- (void)addSubviewsToTopView:(UIView *)V1 view:(UIView *)V2 view:(UIView *)V3
{
    //    NSLog(@"%f , %f",MRScreenWidth,MRScreenHeight);
    
    if (iPhone5 |iPhone5S) {
        
        UIView *imgT1 = [[UIView alloc]initWithFrame:CGRectMake(-mScreenWidth - mScreenHeight + 150, mScreenHeight, mScreenWidth / 4, 46)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 80, 60)];
        img1.image = [UIImage imageNamed:@"cp"];
        img1.userInteractionEnabled = YES;
        [imgT1 addSubview:img1];
        [self.view addSubview:imgT1];
        
        [self MoveViewToView:imgT1 time:1 withX:(mScreenWidth/2) -140 Y:mScreenHeight  - 210 + 40 Width: 100 Height:80 alpha:1];
        UIButton *listViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [img1 addSubview:listViewBtn];
        listViewBtn.frame = img1.frame;
        [listViewBtn addTarget:self action:@selector(listClick) forControlEvents:UIControlEventTouchUpInside];
        
        //我的资产
        UIView *imgT2 = [[UIView alloc]initWithFrame:CGRectMake(mScreenHeight*2,mScreenHeight + 50, 100, 46)];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 80, 32)];
        img2.image = [UIImage imageNamed:@"zc"];
        [imgT2 addSubview:img2];
        img2.userInteractionEnabled = YES;
        
        [self.view addSubview:imgT2];
        
        [self MoveViewToView:imgT2 time:1 withX:85 Y:mScreenHeight  - 225 Width: 80 Height:40 alpha:1];
        UIButton *myMoneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [img2 addSubview:myMoneyBtn];
        myMoneyBtn.frame = img2.frame;
        [myMoneyBtn addTarget:self action:@selector(myMoneyClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIView *imgT3 = [[UIImageView alloc]initWithFrame:CGRectMake(-(mScreenHeight)*2, mScreenHeight*2, imgT1.frame.size.width, 46)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 70, 55)];
        img3.image = [UIImage imageNamed:@"lc"];
        img3.userInteractionEnabled = YES;
        
        [imgT3 addSubview:img3];
        [self.view addSubview:imgT3];
        
        [self MoveViewToView:imgT3 time:1 withX:170 Y:mScreenHeight - 310 + 40 Width:70 Height:46 alpha:1];
        UIButton *financialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:financialBtn];
        financialBtn.frame = CGRectMake(200, 300, 100, 55);
        // financialBtn.backgroundColor = [UIColor redColor];
        [financialBtn addTarget:self action:@selector(financialClick) forControlEvents:UIControlEventTouchUpInside];
    }else if (iphone6){
        
        UIView *imgT1 = [[UIView alloc]initWithFrame:CGRectMake(-mScreenWidth - mScreenHeight + 150, mScreenHeight, mScreenWidth / 4, 46)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 100,80)];
        img1.image = [UIImage imageNamed:@"cp"];
        img1.userInteractionEnabled = YES;
        [imgT1 addSubview:img1];
        [self.view addSubview:imgT1];
        
        [self MoveViewToView:imgT1 time:1 withX:(mScreenWidth/2) -160 Y:mScreenHeight  - 230 + 40 Width: 100 Height:80 alpha:1];
        UIButton *listViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [img1 addSubview:listViewBtn];
        listViewBtn.frame = img1.frame;
        [listViewBtn addTarget:self action:@selector(listClick) forControlEvents:UIControlEventTouchUpInside];
        
        //我的资产
        UIView *imgT2 = [[UIView alloc]initWithFrame:CGRectMake(mScreenHeight*2,mScreenHeight + 50, 100, 46)];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 100, 38)];
        img2.image = [UIImage imageNamed:@"zc"];
        [imgT2 addSubview:img2];
        img2.userInteractionEnabled = YES;
        
        [self.view addSubview:imgT2];
        
        [self MoveViewToView:imgT2 time:1 withX:93 Y:mScreenHeight  - 250 Width: 80 Height:40 alpha:1];
        UIButton *myMoneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [img2 addSubview:myMoneyBtn];
        myMoneyBtn.frame = img2.frame;
        [myMoneyBtn addTarget:self action:@selector(myMoneyClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIView *imgT3 = [[UIImageView alloc]initWithFrame:CGRectMake(-(mScreenHeight)*2, mScreenHeight*2, imgT1.frame.size.width, 46)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 100, 60)];
        img3.image = [UIImage imageNamed:@"lc"];
        img3.userInteractionEnabled = YES;
        
        [imgT3 addSubview:img3];
        [self.view addSubview:imgT3];
        
        [self MoveViewToView:imgT3 time:1 withX:170 Y:mScreenHeight - 390 + 40 Width:70 Height:46 alpha:1];
        UIButton *financialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:financialBtn];
        financialBtn.frame = CGRectMake(220, mScreenHeight - 350, 100, 60);
        // financialBtn.backgroundColor = [UIColor redColor];
        [financialBtn addTarget:self action:@selector(financialClick) forControlEvents:UIControlEventTouchUpInside];
    }else if (iPhone4){
        
        UIView *imgT1 = [[UIView alloc]initWithFrame:CGRectMake(-mScreenWidth - mScreenHeight + 150, mScreenHeight, mScreenWidth / 4, 46)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 80, 60)];
        img1.image = [UIImage imageNamed:@"cp"];
        img1.userInteractionEnabled = YES;
        [imgT1 addSubview:img1];
        [self.view addSubview:imgT1];
        
        [self MoveViewToView:imgT1 time:1 withX:(mScreenWidth/2) -135 Y:mScreenHeight  - 205 + 65 Width: 100 Height:80 alpha:1];
        UIButton *listViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [img1 addSubview:listViewBtn];
        listViewBtn.frame = img1.frame;
        [listViewBtn addTarget:self action:@selector(listClick) forControlEvents:UIControlEventTouchUpInside];
        
        //我的资产
        UIView *imgT2 = [[UIView alloc]initWithFrame:CGRectMake(mScreenHeight*2,mScreenHeight + 50, 100, 46)];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 80, 32)];
        img2.image = [UIImage imageNamed:@"zc"];
        [imgT2 addSubview:img2];
        img2.userInteractionEnabled = YES;
        
        [self.view addSubview:imgT2];
        
        [self MoveViewToView:imgT2 time:1 withX:85 Y:mScreenHeight  - 185 Width: 80 Height:40 alpha:1];
        UIButton *myMoneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [img2 addSubview:myMoneyBtn];
        myMoneyBtn.frame = img2.frame;
        [myMoneyBtn addTarget:self action:@selector(myMoneyClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIView *imgT3 = [[UIImageView alloc]initWithFrame:CGRectMake(-(mScreenHeight)*2, mScreenHeight*2, imgT1.frame.size.width, 46)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 80, 55)];
        img3.image = [UIImage imageNamed:@"lc"];
        img3.userInteractionEnabled = YES;
        
        [imgT3 addSubview:img3];
        [self.view addSubview:imgT3];
        
        [self MoveViewToView:imgT3 time:1 withX:150 Y:mScreenHeight - 315 + 70 Width:70 Height:46 alpha:1];
        UIButton *financialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:financialBtn];
        financialBtn.frame = CGRectMake(180, 240, 100, 40);
        // financialBtn.backgroundColor = [UIColor redColor];
        [financialBtn addTarget:self action:@selector(financialClick) forControlEvents:UIControlEventTouchUpInside];
    }else
    {
        //产品列表
        UIView *imgT1 = [[UIView alloc]initWithFrame:CGRectMake(-mScreenWidth - mScreenHeight + 150, mScreenHeight, mScreenWidth / 4, 46)];
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 120,65)];
        img1.image = [UIImage imageNamed:@"cp"];
        img1.userInteractionEnabled = YES;
        [imgT1 addSubview:img1];
        [self.view addSubview:imgT1];
        
        [self MoveViewToView:imgT1 time:1 withX:(mScreenWidth/2) -165 Y:mScreenHeight  - 278 + 40 Width: 100 Height:80 alpha:1];
        UIButton *listViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:listViewBtn];
        listViewBtn.frame = CGRectMake(85, mScreenHeight - 250, 150, 60);
        // listViewBtn.backgroundColor = [UIColor redColor];
        [listViewBtn addTarget:self action:@selector(listClick) forControlEvents:UIControlEventTouchUpInside];
        
        //我的资产
        UIView *imgT2 = [[UIView alloc]initWithFrame:CGRectMake(mScreenHeight*2,mScreenHeight + 50, 100, 46)];
        UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 120, 35)];
        img2.image = [UIImage imageNamed:@"zc"];
        [imgT2 addSubview:img2];
        img2.userInteractionEnabled = YES;
        
        [self.view addSubview:imgT2];
        
        [self MoveViewToView:imgT2 time:1 withX:110 Y:mScreenHeight  - 320 Width: 80 Height:40 alpha:1];
        UIButton *myMoneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:myMoneyBtn];
        myMoneyBtn.frame = CGRectMake(150, mScreenHeight - 340, 150, 60);
        ;
        // myMoneyBtn.backgroundColor = [UIColor redColor];
        [myMoneyBtn addTarget:self action:@selector(myMoneyClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        UIView *imgT3 = [[UIImageView alloc]initWithFrame:CGRectMake(-(mScreenHeight)*2, mScreenHeight*2, imgT1.frame.size.width, 46)];
        UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(img1.frame.origin.x, 0, 120,55)];
        img3.image = [UIImage imageNamed:@"lc"];
        img3.userInteractionEnabled = YES;
        
        [imgT3 addSubview:img3];
        [self.view addSubview:imgT3];
        
        [self MoveViewToView:imgT3 time:1 withX:200 Y:mScreenHeight - 458 + 40 Width:70 Height:46 alpha:1];
        UIButton *financialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:financialBtn];
        financialBtn.frame = CGRectMake(235, mScreenHeight - 415, 110, 60);
        // financialBtn.backgroundColor = [UIColor redColor];
        [financialBtn addTarget:self action:@selector(financialClick) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
    
}


- (void)MoveViewToView:(UIView*)view  time:(NSTimeInterval)time withX:(CGFloat)X Y:(CGFloat)Y Width:(CGFloat)width Height:(CGFloat)height alpha:(CGFloat)alpha
{
    [UIView animateWithDuration:time animations:^{
        view.frame = CGRectMake(X, Y, width, height);
    } completion:^(BOOL finished) {
        view.alpha = alpha;
    }];
}


//底部
-(void)createButtom
{
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame = CGRectMake((mScreenWidth-100)/2, mScreenHeight-39, 100, 30);
    buyBtn.backgroundColor = [UIColor colorWithRed:235/255.f green:235/255.f blue:240/255.f alpha:1];;
    buyBtn.layer.masksToBounds = YES;
    buyBtn.layer.cornerRadius = 5;
    [self.view addSubview:buyBtn];
    
    [buyBtn setTitle:@"特卖推荐" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor colorWithRed:11/255.f green:89/255.f blue:253/255.f alpha:1] forState:UIControlStateNormal];
    
    UILabel *lab1 = [[UILabel alloc] init];
    UIFont *font = [UIFont boldSystemFontOfSize:12];
    lab1.font = font;
    lab1.frame = CGRectMake(buyBtn.frame.origin.x-25, mScreenHeight-68, 60, font.lineHeight);
    lab1.textColor = [UIColor whiteColor];
    lab1.text = @"起始金额：";
    [self.view addSubview:lab1];
    
    self.startMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(lab1.frame.origin.x+60, mScreenHeight-68, 60, font.lineHeight)];
    self.startMoneyLabel.textColor = [UIColor whiteColor];
    self.startMoneyLabel.font = [UIFont boldSystemFontOfSize:12];
    [self.view addSubview:self.startMoneyLabel];
    self.startMoneyLabel.text = @"100元";
    
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(self.startMoneyLabel.frame.origin.x+40, mScreenHeight-68, 40, font.lineHeight)];
    lab2.text = @"期限：";
    lab2.font = [UIFont boldSystemFontOfSize:12];
    lab2.textColor = [UIColor whiteColor];
    [self.view addSubview:lab2];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(lab2.frame.origin.x+30, mScreenHeight-68, 40, font.lineHeight)];
    self.dateLabel.text = @"30天";
    self.dateLabel.font = [UIFont boldSystemFontOfSize:12];
    self.dateLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.dateLabel];

    //将iPhone4单独处理
    if (iPhone4) {
      
        buyBtn.frame = CGRectMake((mScreenWidth-100)/2, mScreenHeight-35, 90, 30);

        lab1.frame = CGRectMake(buyBtn.frame.origin.x-25, mScreenHeight-54, 60, font.lineHeight);
        
        self.startMoneyLabel.frame = CGRectMake(lab1.frame.origin.x+60, mScreenHeight-54, 60, font.lineHeight);
        
       lab2.frame = CGRectMake(self.startMoneyLabel.frame.origin.x+40, mScreenHeight-54, 40, font.lineHeight);
        
        self.dateLabel.frame = CGRectMake(lab2.frame.origin.x+30, mScreenHeight-54, 40, font.lineHeight);
    }
    
}

//数字滚动
-(void)rateNumChange
{

        self.currentIndex = 0;
        self.numbersArray = @[@17, @15, @22, @12, @28, @12,@12];
    
        UIFont *font = [UIFont boldSystemFontOfSize: 55];
    
        self.tickerLabel = [[ADTickerLabel alloc] initWithFrame: CGRectMake((mScreenWidth-100)/2+30, mScreenHeight-125, 0, font.lineHeight)];
       // self.tickerLabel.text = @"00";
        self.tickerLabel.font = font;
        self.tickerLabel.characterWidth = 29;
        self.tickerLabel.changeTextAnimationDuration = 0.4;
        self.tickerLabel.textColor = [UIColor whiteColor];;
        [self.view addSubview: self.tickerLabel];
    
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.tickerLabel.frame.origin.x, mScreenHeight-110, 40, 40)];
        label.text = @".";
        [self.view addSubview:label];
        label.font = [UIFont boldSystemFontOfSize:50];
        label.textColor = [UIColor whiteColor];;
    
        self.numbersArray1 = @[@10, @11, @34, @20, @90, @34,@00];
        UIFont *font1 = [UIFont boldSystemFontOfSize: 41];
        self.tickerLabel1 = [[ADTickerLabel alloc] initWithFrame: CGRectMake(label.frame.origin.x+65, mScreenHeight-113, 0, font.lineHeight)];
        self.tickerLabel1.font = font1;
        self.tickerLabel1.characterWidth = 25;
        self.tickerLabel1.changeTextAnimationDuration = 0.4;
        [self.view addSubview: self.tickerLabel1];
        self.tickerLabel1.textColor = [UIColor whiteColor];;
 
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(self.tickerLabel1.frame.origin.x, mScreenHeight-105, 30, 40)];
        label1.text = @"%";
        [self.view addSubview:label1];
        label1.font = [UIFont boldSystemFontOfSize:30];
        label1.textColor = [UIColor whiteColor];;
    
    if (iPhone4) {
        
        UIFont *font = [UIFont boldSystemFontOfSize: 40];
        self.tickerLabel.frame =  CGRectMake((mScreenWidth-100)/2+35, mScreenHeight-95, 0, font.lineHeight);
        self.tickerLabel.font = font;
        self.tickerLabel.characterWidth = 21;
        
        label.frame = CGRectMake(self.tickerLabel.frame.origin.x, mScreenHeight-90, 10, 40);
        label.font = [UIFont boldSystemFontOfSize:40];
        
        self.tickerLabel1.frame = CGRectMake(label.frame.origin.x+45, mScreenHeight-85, 0, font.lineHeight);
        self.tickerLabel1.font = [UIFont boldSystemFontOfSize:30];
        self.tickerLabel1.characterWidth = 18;
        
        label1.frame = CGRectMake(self.tickerLabel1.frame.origin.x, mScreenHeight-85, 30, 40);
        label1.font = [UIFont boldSystemFontOfSize:20];
        
        
    }


}



-(void)viewDidAppear:(BOOL)animated{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(changeClick:) userInfo:nil repeats:YES];
    _timer1 = [NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(changeClick:) userInfo:nil repeats:NO];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

-(void)changeClick: (NSTimer*)timer
{
    if (timer==_timer) {
        self.tickerLabel.text = [NSString stringWithFormat:@"%@", self.numbersArray[self.currentIndex]];
        
        self.tickerLabel1.text = [NSString stringWithFormat:@"%@", self.numbersArray1[self.currentIndex]];
        self.currentIndex++;
        if(self.currentIndex == [self.numbersArray count]) self.currentIndex = 0;
      }
    if (timer == _timer1) {
        [_timer invalidate];
        //        self.tickerLabel.text = [NSString stringWithFormat:@"%@", self.numbersArray[6]];
        //        self.tickerLabel1.text = [NSString stringWithFormat:@"%@", self.numbersArray1[6]];
        self.tickerLabel.text = @"12";
        self.tickerLabel1.text = @"00";
        
        [_timer1 invalidate];
    }
    
    
}

//产品列表
-(void)listClick
{
    ListViewController *list = [[ListViewController alloc] init];
    [self.navigationController pushViewController:list animated:YES];
 
 //   [self presentModalViewController:list animated:YES];
    NSLog(@"********");
}

-(void)myMoneyClick
{
    NSLog(@"我的资产");
}

-(void)financialClick
{
    NSLog(@"理财达人");
}

//消息
-(void)informationClick
{
    NSLog(@"xiaoxi");
}


//设置
-(void)setClick
{
    NSLog(@"设置");
 
}

@end
