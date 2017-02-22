//
//  FYYBaseNavViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYBaseNavViewController.h"

@interface FYYBaseNavViewController ()

@end

@implementation FYYBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIColor * radomcolor = [UIColor colorWithRed:36/255.0 green:215/255.0 blue:200/255.0 alpha:1];
    
    self.navigationBar.barTintColor = radomcolor;
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
