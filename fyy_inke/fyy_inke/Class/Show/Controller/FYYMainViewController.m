//
//  FYYMainViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYMainViewController.h"
#import "FYYMainTopView.h"

@interface FYYMainViewController ()<UIScrollViewDelegate>

//*    */
@property (nonatomic, strong) UIScrollView *mainSrcol;

//*    */
@property (nonatomic, strong) NSArray *dataTitles;

//*    */
@property (nonatomic, strong) FYYMainTopView *topView;

@end

@implementation FYYMainViewController

- (FYYMainTopView *)topView {
    if (!_topView) {
        _topView = [[FYYMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) titles:self.dataTitles];
        WeakSelf;
        _topView.mainBlock = ^(NSInteger idx){
            [weakSelf.mainSrcol setContentOffset:CGPointMake(SCREEN_WIDTH *idx, 0) animated:YES];
        };
        
    }
    return _topView;
}

- (NSArray *)dataTitles {
    if (!_dataTitles) {
        _dataTitles = @[@"关注",@"热门",@"附近"];
    }
    return _dataTitles;
}

- (UIScrollView *)mainSrcol {
    if (!_mainSrcol) {
        _mainSrcol = [[UIScrollView alloc]init];
        _mainSrcol.frame = [UIScreen mainScreen].bounds;
        _mainSrcol.delegate = self;
        _mainSrcol.pagingEnabled = YES;
}
    return _mainSrcol;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
}

- (void)initUI {
    [self setUpNav];
    [self setUpViewControllers];
}

- (void)setUpNav {
    [self.view addSubview:self.mainSrcol];
    self.navigationItem.titleView = self.topView;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:self action:nil];
}
- (void)setUpViewControllers {
    NSArray *viewControlNames = @[@"FYYAttensionViewController",@"FYYHotViewController",@"FYYNearViewController"];
    for (int i = 0; i <viewControlNames.count; i ++) {
        NSString *viewControlName = viewControlNames[i];
        UIViewController *vc = [[NSClassFromString(viewControlName) alloc] init];
        vc.title = self.dataTitles[i];
        [self addChildViewController:vc];
    }
    self.mainSrcol.contentSize = CGSizeMake(SCREEN_WIDTH * self.dataTitles.count, 0);
    [self.mainSrcol setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
    [self scrollViewDidEndDecelerating:self.mainSrcol];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger idx = offsetX/SCREEN_WIDTH;
    [self.topView scrolling:idx];
    UIViewController *childVc = self.childViewControllers[idx];
    if ([childVc isViewLoaded])  return;
    childVc.view.frame = CGRectMake(offsetX, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [scrollView addSubview:childVc.view];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
