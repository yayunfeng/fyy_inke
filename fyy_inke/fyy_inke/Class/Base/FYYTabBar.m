//
//  FYYTabBar.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYTabBar.h"

@interface FYYTabBar()

//*    */
@property (nonatomic, strong) NSArray *dataList;

//*    */
@property (nonatomic, strong) UIButton *lastBtn;

@property (nonatomic, strong) UIImageView *bgImageView;

//*    */
@property (nonatomic, strong) UIButton *cameraBtn;

@end

@implementation FYYTabBar

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"global_tab_bg"];
    }
    return _bgImageView;
}

- (UIButton *)cameraBtn {
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        _cameraBtn.adjustsImageWhenHighlighted = NO;
        _cameraBtn.tag = FYYTabBarLaunch;
        [_cameraBtn addTarget:self action:@selector(itemCLick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bgImageView];
        for (int i = 0; i < self.dataList.count; i ++) {
            UIButton *Item = [UIButton buttonWithType:UIButtonTypeCustom];
            [Item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [Item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            Item.tag = i + FYYTabBarShow;
            [Item addTarget:self action:@selector(itemCLick:) forControlEvents:UIControlEventTouchUpInside];
            Item.adjustsImageWhenHighlighted = NO;
            if (i == 0) {
                Item.selected = YES;
                self.lastBtn = Item;
            }
            [self addSubview:Item];
        }
        [self addSubview:self.cameraBtn];
    }
    return self;
}

- (void)itemCLick:(UIButton *)btn {
    !self.tabBlock?:self.tabBlock(self,btn.tag);
    if (btn.tag == FYYTabBarLaunch) {
        return;
    }
    if (self.lastBtn == btn) {
        return;
    }
    btn.selected = YES;
    self.lastBtn.selected = NO;
    self.lastBtn = btn;
    [UIView animateWithDuration:0.2 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            btn.transform = CGAffineTransformIdentity;
        }];
    }];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnWidth = self.bounds.size.width/2;
    for (int i = 0; i < [self subviews].count; i ++) {
        UIView *subViewItem = [self subviews][i];
        if ([subViewItem isKindOfClass:[UIButton class]]) {
            subViewItem.frame = CGRectMake((subViewItem.tag - FYYTabBarShow)*btnWidth, 0, btnWidth, 49);
        }
    }
    [self.cameraBtn sizeToFit];
    self.cameraBtn.center = CGPointMake(btnWidth, self.frame.size.height * 0.5 - 20);
}

@end
