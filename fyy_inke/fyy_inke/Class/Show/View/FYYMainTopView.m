//
//  FYYMainTopView.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/17.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYMainTopView.h"

@interface FYYMainTopView()

//*    */
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation FYYMainTopView

- (NSArray *)buttons {
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc]init];
    }
    return _buttons;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        self.lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    if (self = [super initWithFrame:frame]) {
        CGFloat btnW = self.width/titles.count;
        CGFloat btnH = self.height;
        CGFloat btnX;
        for (int i = 0; i < titles.count; i ++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.buttons addObject:item];
            [item setTitle:titles[i] forState:UIControlStateNormal];
            [item setTintColor:[UIColor whiteColor]];
            item.titleLabel.font = [UIFont systemFontOfSize:18];
            btnX = i * btnW;
            item.tag = i;
            item.frame = CGRectMake(btnX, 0, btnW, btnH);
            [item addTarget:self action:@selector(itemCLick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:item];
            
            if (i == 1) {
                [item.titleLabel sizeToFit];
                self.lineView.width = item.titleLabel.width;
                self.lineView.height = 2;
                self.lineView.centerX = item.centerX;
                self.lineView.top = 40;
            }
            [self addSubview:self.lineView];
        }
    }
    return self;
}


- (void)itemCLick:(UIButton *)btn {
    !self.mainBlock?:self.mainBlock(btn.tag);
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = btn.centerX;
    }];
}


- (void)scrolling:(NSInteger)tag {
    UIButton *btn = self.buttons[tag];
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = btn.centerX;
    }];
}


@end
