//
//  FYYNearViewController.m
//  fyy_inke
//
//  Created by 冯亚运 on 17/2/17.
//  Copyright © 2017年 冯亚运. All rights reserved.
//

#import "FYYNearViewController.h"
#import "FYYHotHandle.h"
#import "FYYNearCell.h"
#import "FYYPlayerViewController.h"

static NSString * identifierNearCell = @"FYYNearCell";
#define kItemSizeW 100
#define kMargin 5

@interface FYYNearViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

//*    */
@property (nonatomic, strong) NSMutableArray *dataSource;

//*    */
@property (nonatomic, strong) UICollectionView *collection;

@end

@implementation FYYNearViewController

- (UICollectionView *)collection {
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.delegate = self;
        _collection.dataSource = self;
        [_collection registerNib:[UINib nibWithNibName:identifierNearCell bundle:nil] forCellWithReuseIdentifier:identifierNearCell];
    }
    return _collection;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.collection];
    [self loadData];
}

- (void)loadData {
    [self.dataSource removeAllObjects];
    [FYYHotHandle executeGetNearLiveTaskWithPage:1 success:^(id obj) {
        [self.dataSource addObjectsFromArray:obj];
        [self.collection reloadData];
    } failed:^(id obj) {
        
    }];
}

#pragma mark-- 数据源

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FYYNearCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierNearCell forIndexPath:indexPath];
    FYYLive *live = self.dataSource[indexPath.item];
    cell.live = live;
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat outInset = self.view.width - 2 * kMargin;
    NSInteger count = outInset / kItemSizeW;
    NSInteger extraTotal = (NSInteger)(outInset - kMargin * (count - 1 ));
    
    CGFloat itemWH;
    
    if (extraTotal < count * kItemSizeW) {
        
        itemWH = extraTotal / count;
        
    } else {
        
        CGFloat extraWidth = extraTotal % kItemSizeW;
        itemWH = kItemSizeW + extraWidth / count;
    }
    
    return CGSizeMake(itemWH, itemWH + 25);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    FYYPlayerViewController * playerVC = [[FYYPlayerViewController alloc] init];
    
    playerVC.live = self.dataSource[indexPath.row];
    
    [self.navigationController pushViewController:playerVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    FYYNearCell *nearCell = (FYYNearCell *)cell;
    [nearCell showAnimation];
    
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
