//
//  FYYAdeversizeView.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/20.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYAdeversizeView.h"
#import "FYYHotHandle.h"
#import "FYYAdvertise.h"

@interface FYYAdeversizeView()
@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@property (nonatomic, strong) dispatch_source_t timer;

//*    */
@property (nonatomic, assign) NSInteger timeOut;

@end

@implementation FYYAdeversizeView
+ (instancetype)loadAdeversizeView {
    return [[[NSBundle mainBundle] loadNibNamed:@"FYYAdeversizeView" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //显示图片
    [self show];
    //下载图片
    [self downAd];
    //显示倒计时
    [self startTime];
}

- (void)show {
    NSString *fileName = [[NSUserDefaults standardUserDefaults] objectForKey:@"adImage"];
    NSString *filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,fileName];
    UIImage *imageLast = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
//    self.backView.image = imageLast;
    if (imageLast) {
        self.backView.image = imageLast;
    }else {
        self.hidden = YES;
    }
}

- (void)downAd {
    [FYYHotHandle executeGetAdeversizeTaskWithPage:1 success:^(id obj) {
        FYYAdvertise *ad = (FYYAdvertise *)obj;
        //SDWebImageAvoidAutoSetImage 下载不立马肤质給ImageView
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:ad.image] options:SDWebImageAvoidAutoSetImage progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            [[NSUserDefaults standardUserDefaults] setObject:ad.image forKey:@"adImage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }];
    } failed:^(id obj) {
        //
    }];
}

- (void)startTime {
    self.timeOut = 4;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        //
        self.timeOut --;
        if (self.timeOut <= 0){
            dispatch_async(dispatch_get_main_queue(), ^{
                   [self disMiss];
            });
        
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                 self.timeLab.text = [NSString stringWithFormat:@"跳过%zd",self.timeOut];
            });
        }
        
    });
    dispatch_resume(timer);
}

- (void)disMiss {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



@end
