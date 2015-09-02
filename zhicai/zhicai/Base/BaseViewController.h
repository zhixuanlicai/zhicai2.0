
#import <UIKit/UIKit.h>
#import "ATMHud.h"

@interface BaseViewController : UIViewController

@property (strong, nonatomic) UILabel* labelForNone;
@property (strong, nonatomic) UILabel* labelForNone2;
@property (strong, nonatomic) UIImageView* imageForNone;
@property (strong, nonatomic) UIImageView* imageForNone2;
- (void)backBtnAction:(id)sender;


- (void)showBlockHubIndicator;
- (void)hideBlockHubIdicator;

- (void)showHubIndicatorWithTitle:(NSString*)title ShowActivity:(BOOL)showActivity Cancancel:(BOOL)canCancel;
- (void)hideHubIndicator;

- (void)showLongToast:(NSString*)msg;
- (void)showShortToast:(NSString*)msg;
- (void)showShortToastCenter:(NSString*)msg;


- (void)showNoneTip:(NSString*)title Top:(int)top;
- (void)hideNoneTip;
- (void)showNoneTip2:(NSString*)title Top:(int)top;
- (void)hideNoneTip2;
@end
