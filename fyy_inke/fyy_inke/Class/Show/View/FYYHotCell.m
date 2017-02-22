//
//  FYYHotCell.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/18.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYHotCell.h"

@interface FYYHotCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headIcon;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *city;

@property (weak, nonatomic) IBOutlet UILabel *online;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundIcon;


@end

@implementation FYYHotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headIcon.layer.cornerRadius = CGRectGetWidth(self.headIcon.frame) / 2;
    self.headIcon.layer.masksToBounds = YES;
}

-(void)setLive:(FYYLive *)live {
    _live = live;
    self.name.text = live.creator.nick;
    self.city.text = live.city;
    self.online.text = [@(live.onlineUsers) stringValue];
    
    if ([live.creator.nick isEqualToString:@"自己人"]) {
        
        self.headIcon.image = [UIImage  imageNamed:@"my.png"];
        self.backGroundIcon.image = [UIImage  imageNamed:@"my.png"];
        
    } else {
        
        [self.headIcon downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
        [self.backGroundIcon downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
