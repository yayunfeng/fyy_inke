//
//  FYYMeViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/16.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYMeViewController.h"
#import "FYYMeHeadView.h"
#import "FYYSettingModal.h"
static NSString *meCellIdentifer = @"tabViewCell";
@interface FYYMeViewController ()<UITableViewDelegate,UITableViewDataSource>

//*    */
@property (nonatomic, strong) FYYMeHeadView *meHeadView;

//*    */
@property (nonatomic, strong) NSMutableArray *dataSource;

//*    */
@property (nonatomic, strong) UITableView *myTab;

@end

@implementation FYYMeViewController

- (FYYMeHeadView *)meHeadView {
    if (!_meHeadView) {
        _meHeadView = [FYYMeHeadView loadMeHeadView];
    }
    return _meHeadView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (UITableView *)myTab {
    if (!_myTab) {
        _myTab = [[UITableView alloc]initWithFrame:CGRectMake(0, -40, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
        _myTab.tableFooterView = [UIView new];
        _myTab.delegate = self;
        _myTab.dataSource = self;
        [_myTab registerClass:[UITableViewCell class] forCellReuseIdentifier:meCellIdentifer];

    }
    return _myTab;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self loadData];
    
}

- (void)initUI {
    [self.view addSubview:self.myTab];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.myTab.rowHeight = 60;
    self.myTab.sectionFooterHeight = 5;
    //self.myTab.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
}

- (void)loadData {
    [self.dataSource removeAllObjects];
    FYYSettingModal * set1 = [[FYYSettingModal alloc] init];
    set1.title = @"映客贡献榜";
    set1.subtitle = @"";
    set1.vcName = @"";
    
    FYYSettingModal * set2 = [[FYYSettingModal alloc] init];
    set2.title = @"收益";
    set2.subtitle = @"0映票";
    set2.vcName = @"";
    
    FYYSettingModal * set3 = [[FYYSettingModal alloc] init];
    set3.title = @"账户";
    set3.subtitle = @"0钻石";
    set3.vcName = @"";
    
    FYYSettingModal * set4 = [[FYYSettingModal alloc] init];
    set4.title = @"等级";
    set4.subtitle = @"3级";
    set4.vcName = @"";
    
    FYYSettingModal * set5 = [[FYYSettingModal alloc] init];
    set5.title = @"实名认证";
    set5.subtitle = @"";
    set5.vcName = @"";
    
    FYYSettingModal * set6 = [[FYYSettingModal alloc] init];
    set6.title = @"设置";
    set6.subtitle = @"";
    set6.vcName = @"";
    
    
    NSArray * arr1 = @[set1,set2,set3];
    NSArray * arr2 = @[set4,set5];
    NSArray * arr3 = @[set6];
    [self.dataSource addObject:arr1];
    [self.dataSource addObject:arr2];
    [self.dataSource addObject:arr3];
    
    [self.myTab reloadData];
}

#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *singData = self.dataSource[section];
    return singData.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:meCellIdentifer forIndexPath:indexPath];
    
    FYYSettingModal * set = self.dataSource[indexPath.section][indexPath.row];
    
    cell.textLabel.text = set.title;
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.text = set.subtitle;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.meHeadView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 340;
    }
    
    return 0.1;
}

@end
