

#import "BaseViewController.h"

@interface BaseViewController ()
{
        ATMHud* hubATM;
}

@end

@implementation BaseViewController

- (void)loadView
{
    [super loadView];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_back.png" andHighImageName:@"icon_back.png" target:self action:@selector(backBtnAction:)];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnAction:)];
    //手势
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backBtnAction:)];
    [self.view addGestureRecognizer:swipe];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"F0EFF5"]];
    // Do any additional setup after loading the view.
}

- (void)backBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
