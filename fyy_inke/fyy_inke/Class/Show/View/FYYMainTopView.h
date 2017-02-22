//
//  FYYMainTopView.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/17.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FyyMainBlock)(NSInteger idx);

@interface FYYMainTopView : UIView

//*    */
@property (nonatomic, copy) FyyMainBlock mainBlock;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
- (void)scrolling:(NSInteger)tag;

@end
