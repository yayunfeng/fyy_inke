//
//  FYYLoginViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/22.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYLoginViewController.h"
#import "FYYUserHelper.h"
#import "FYYTabBarViewController.h"

@interface FYYLoginViewController ()

@end

@implementation FYYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginBtnCLick:(UIButton *)sender {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
            [FYYUserHelper sharedMange].userName = snsAccount.userName;
            [FYYUserHelper sharedMange].imgUrl = snsAccount.iconURL;
            //保存入本地
            [FYYUserHelper saveUser];
            
            self.view.window.rootViewController = [[FYYTabBarViewController alloc] init];
            
        } else {
            
            NSLog(@"登录失败");
        }
        
    });
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
