//
//  FYYNearCell.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/20.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYNearCell.h"

@interface FYYNearCell()
@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UILabel *distanceLab;

@end

@implementation FYYNearCell

- (void)showAnimation {
    if (self.live.show) {
        return;
    }
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.5 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.live.show = YES;
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLive:(FYYLive *)live {
    _live = live;
    [self.headIcon downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,_live.creator.portrait] placeholder:@"defalut_room"];
    self.distanceLab.text = _live.distance;
}

@end
