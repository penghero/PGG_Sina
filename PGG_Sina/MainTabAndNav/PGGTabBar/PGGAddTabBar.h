//
//  PGGAddTabBar.h
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/13.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 自定义的TabBar
 */
@class PGGAddTabBar;
@protocol PGGTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(PGGAddTabBar *)tabBar;
@end

@interface PGGAddTabBar : UITabBar

@property(nonatomic,weak)id <PGGTabBarDelegate> delegate;

@end
