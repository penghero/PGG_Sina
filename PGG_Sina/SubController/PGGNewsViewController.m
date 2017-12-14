//
//  PGGNewsViewController.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/13.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//代码地址 https://github.com/penghero/PGG_Sina.git

#import "PGGNewsViewController.h"
#import "PGGTestViewController.h"
#import "LLSegmentBarVC.h"

@interface PGGNewsViewController ()
@property (nonatomic,weak) LLSegmentBarVC * segmentVC;//
@end

@implementation PGGNewsViewController
#pragma mark - segmentVC
- (LLSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LLSegmentBarVC *vc = [[LLSegmentBarVC alloc]init];
            // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavItem];
}
#pragma mark - 定制导航条内容
- (void) customNavItem {
    self.title = @"消息";
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    UIButton *rightBtn = [[UIButton alloc] init];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setTitle:@"发现群" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
        // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(100, 0, kScreen_Width-200, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
        // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"通知", @"聊天"];
    UIViewController *follow = [[UIViewController alloc] init];
    follow.view.backgroundColor = [UIColor greenColor];
    UIViewController *find = [[UIViewController alloc] init];
    find.view.backgroundColor = [UIColor orangeColor];
        // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[follow,find]];
        // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor lightGrayColor]).itemSelectColor([UIColor blackColor]).indicatorColor([UIColor orangeColor]);
    }];
}
- (void)rightAction {
    
}
- (void)leftAction {
    PGGTestViewController *test = [[PGGTestViewController alloc] init];
    [self.navigationController pushViewController:test animated:YES];
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
