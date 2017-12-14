//
//  PGGNavigationController.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/13.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//代码地址 https://github.com/penghero/PGG_Sina.git

#import "PGGNavigationController.h"
#import "UIView+PGGExtension.h"
#import "UIBarButtonItem+PGGExtension.h"


@interface PGGNavigationController ()

@end

@implementation PGGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //解决自定义返回按钮后滑动手势失效的问题
    self.interactivePopGestureRecognizer.delegate = nil;

}
+(void)initialize {
    //导航栏背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    //导航栏左右按钮字体颜色
    [[UINavigationBar appearance] setTintColor:[UIColor grayColor]];
        //修改标题字体颜色及大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    UIBarButtonItem *item= [UIBarButtonItem appearance];
        //设置导航栏按钮字体颜色
    NSMutableDictionary *textArr = [NSMutableDictionary dictionary];
    textArr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textArr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textArr forState:UIControlStateNormal];
        //不可选中状态
    NSMutableDictionary *disableTextArr = [NSMutableDictionary dictionary];
    disableTextArr[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disableTextArr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:disableTextArr forState:UIControlStateDisabled];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.childViewControllers.count > 0) {
        //push后隐藏TabBarController
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" heighlightImage:@"navigationbar_back_highlighted"];
    }
    //这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    //解决iPhone X push页面时 tabBar上移的问题
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}


-(void)back {
    [self popViewControllerAnimated:YES];
//    [self popToRootViewControllerAnimated:YES];//返回跟控制器

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
