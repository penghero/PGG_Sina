//
//  PGGFindViewController.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/13.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "PGGFindViewController.h"
#import "PGGSearchView.h"
#import "UIView+PGGExtension.h"

@interface PGGFindViewController ()

@end

@implementation PGGFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavItem];
}
#pragma mark - 定制导航条内容
- (void) customNavItem {
    PGGSearchView *searchBar = [PGGSearchView searchBar];
    searchBar.width = 375;
    searchBar.height = 30;
    self.navigationItem.titleView = searchBar;
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
