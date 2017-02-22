//
//  FYYNearCell.h
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/20.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYYLive.h"

@interface FYYNearCell : UICollectionViewCell

//*    */
@property (nonatomic, strong) FYYLive *live;

- (void)showAnimation;
@end
