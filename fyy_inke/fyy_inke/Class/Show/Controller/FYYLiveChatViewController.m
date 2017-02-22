//
//  FYYLiveChatViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/20.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYLiveChatViewController.h"

@interface FYYLiveChatViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UIButton *online;

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation FYYLiveChatViewController

- (void)setLive:(FYYLive *)live {
    _live = live;
    //给控件肤质
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initTimer];
}

- (void)initTimer {
    
    //初始化心形动画
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        //多发几次请求去
//        [self showMoreLoveAnimateFromView:self.shareBtn addToView:self.view];
    });
    dispatch_resume(self.timer);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
