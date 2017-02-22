//
//  FYYTabBarViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYTabBarViewController.h"
#import "FYYTabBar.h"
#import "FYYLaunchViewController.h"
#import "FYYBaseNavViewController.h"

@interface FYYTabBarViewController ()

//*    */
@property (nonatomic, strong) FYYTabBar *fyyTabBar;

@end

@implementation FYYTabBarViewController

- (FYYTabBar *)fyyTabBar {
    if (!_fyyTabBar) {
        _fyyTabBar = [[FYYTabBar alloc]init];
        WeakSelf;
        _fyyTabBar.tabBlock = ^(FYYTabBar *tabBar,FYYTabBarType idx){
            if (idx == FYYTabBarLaunch) {
                FYYLaunchViewController *launchVc = [[FYYLaunchViewController alloc] init];
                [weakSelf presentViewController:launchVc animated:YES completion:nil];
            }else{
                weakSelf.selectedIndex = idx - FYYTabBarShow;
            }
            };
        _fyyTabBar.frame = self.tabBar.bounds;
    }
    return _fyyTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1  设置控制器
    [self configureController];
    
    //2加载tabBar
    [self.tabBar addSubview:self.fyyTabBar];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
}


- (void)configureController {
    NSMutableArray *viewControllerNames = [NSMutableArray arrayWithArray:@[@"FYYMainViewController",@"FYYMeViewController"]];
    for (int i = 0; i <viewControllerNames.count; i ++) {
        NSString *viewName = viewControllerNames[i];
        UIViewController *vc = [[NSClassFromString(viewName) alloc] init];
        UINavigationController *nav = [[FYYBaseNavViewController alloc] initWithRootViewController:vc];
        [viewControllerNames replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = viewControllerNames;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
