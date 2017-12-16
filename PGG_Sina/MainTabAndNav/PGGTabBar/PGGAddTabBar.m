//
//  PGGAddTabBar.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/13.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//代码地址 https://github.com/penghero/PGG_Sina.git

#import "PGGAddTabBar.h"
#import "UIView+PGGExtension.h"

@interface PGGAddTabBar ()
@property (nonatomic, weak) UIButton *plusBtn;
@end

@implementation PGGAddTabBar

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
            // 添加一个按钮到tabbar中
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}

-(void)plusClick {
        //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
        //设置加号的位置
    self.plusBtn.centerX = self.width *0.5;
    if (kDevice_Is_iPhoneX) {
        self.plusBtn.centerY = self.height *0.3; //没有超过tabbar高度 无需处理
    } else {
        self.plusBtn.centerY = self.height *0.05;//加号超过tabbar高度后 无响应
    }
        //设置其他tabbarButton的位置和尺寸
    CGFloat tabBarButtonW  = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width = tabBarButtonW;
            child.x = tabbarButtonIndex *tabBarButtonW;
                //增加索引
            tabbarButtonIndex ++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex ++;
            }
        }
    }
}

#pragma mark - 重写hitTest方法 处理凸出的部分点击无效
 - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
/*这一个判断是关键，不判断的话push到其他页面，点击自定义按钮的位置也是会有反应的
 *self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
 *在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在自定义按钮身上
 *是的话让自定义按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
 */
     if (self.isHidden == NO) {
         /* 将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点 */
         CGPoint newPoint = [self convertPoint:point toView:self.plusBtn];
         /* 判断如果这个新的点是在自定义按钮身上，处理突出部分的自定义按钮*/
         if ( [self.plusBtn pointInside:newPoint withEvent:event]) {
             return self.plusBtn;
         }else{
             /*如果点不在自定义按钮身上，直接让系统处理*/
             return [super hitTest:point withEvent:event];
         }
     }
     else {
         /* tabbar隐藏后，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理*/
         return [super hitTest:point withEvent:event];
     }
  }
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
