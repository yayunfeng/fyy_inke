//
//  FYYMeHeadView.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/22.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYMeHeadView.h"

@implementation FYYMeHeadView

+ (instancetype)loadMeHeadView {
    return [[[NSBundle mainBundle] loadNibNamed:@"FYYMeHeadView" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 340);
}
@end
