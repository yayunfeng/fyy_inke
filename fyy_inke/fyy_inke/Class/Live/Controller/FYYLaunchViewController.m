//
//  FYYLaunchViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYLaunchViewController.h"
#import "FYYLivePrevew.h"

@interface FYYLaunchViewController ()

@end

@implementation FYYLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)startLive:(id)sender {
    UIView * back = [[UIView alloc] initWithFrame:self.view.bounds];
    back.backgroundColor = [UIColor blackColor];
    [self.view addSubview:back];
    
    FYYLivePrevew * liveView = [[FYYLivePrevew alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:liveView];
    [liveView startLive];
}


@end
