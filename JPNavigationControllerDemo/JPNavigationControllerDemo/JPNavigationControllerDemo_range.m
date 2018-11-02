/*
 * This file is part of the JPNavigationController package.
 * (c) NewPan <13246884282@163.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * Click https://github.com/newyjp
 * or http://www.jianshu.com/users/e2f2d779c022/latest_articles to contact me.
 */

#import "JPNavigationControllerDemo_range.h"
#import "JPNavigationControllerKit.h"
#import "JPNavigationControllerCompat.h"
#import "JPNavigationControllerDemo_linkBar.h"

@interface JPNavigationControllerDemo_range ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blankWidCons;

@end

@implementation JPNavigationControllerDemo_range

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (IBAction)popToVcBtnClick:(id)sender {
    
    NSArray<UIViewController *> *viewControllersInNavigationControllerStack = [self.navigationController.jp_rootNavigationController jp_viewControllers];
    NSLog(@"导航控制器里所有的子控制器 : %@", viewControllersInNavigationControllerStack);
    
    [self.navigationController jp_popToViewControllerWithClass:[JPNavigationControllerDemo_linkBar class] handler:^UIViewController * _Nullable(NSArray<UIViewController *> * _Nullable viewControllers, NSError * _Nullable error) {
        
        if (!error) {
            return viewControllers.firstObject;
        }
        else{
            NSLog(@"%@", error);
            return nil;
        }
        
    } animated:YES];
}


#pragma mark - Setup

- (void)setup{
    self.title = @"pop 手势范围";
    
    UIButton *rangeBtn = [UIButton new];
    [rangeBtn setTitle:@"手势范围设为 100.f" forState:UIControlStateNormal];
    [rangeBtn setTitle:@"手势范围设为全屏" forState:UIControlStateSelected];
    rangeBtn.backgroundColor = [UIColor whiteColor];
    [rangeBtn setTitleColor:self.view.tintColor forState:UIControlStateNormal];
    [rangeBtn addTarget:self action:@selector(rangeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationController.jp_linkViewHeight = 44.f;
    self.navigationController.jp_linkView = rangeBtn;
    
    // 读取当前的手势范围值,来定义控件
    CGFloat currentPopRange = self.navigationController.jp_interactivePopMaxAllowedInitialDistanceToLeftEdge;
    if (currentPopRange != JPScreenW) {
        rangeBtn.selected = YES;
    }
    self.blankWidCons.constant = JPScreenW - currentPopRange;
    [self.view layoutIfNeeded];
}

- (void)rangeBtnClick:(UIButton *)btn{
    btn.selected = ! btn.selected;
    
    CGFloat popRange;
    if (btn.selected) {
        popRange = 100.f;
        
    }
    else{
        popRange = JPScreenW;
    }
    
    // custom the biggest distance allow pop leave screen left slide in current root navigation controller.
    self.navigationController.jp_interactivePopMaxAllowedInitialDistanceToLeftEdge = popRange;
    self.blankWidCons.constant = JPScreenW - popRange;
    [UIView animateWithDuration:0.25f animations:^{
        
        [self.view layoutIfNeeded];
        
    }];
}

@end
