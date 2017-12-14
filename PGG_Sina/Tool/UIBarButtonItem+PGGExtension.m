//
//  UIBarButtonItem+PGGExtension.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/14.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//代码地址 https://github.com/penghero/PGG_Sina.git

#import "UIBarButtonItem+PGGExtension.h"
#import "UIView+PGGExtension.h"

@implementation UIBarButtonItem (PGGExtension)
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image heighlightImage:(NSString *)heilightImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:heilightImage] forState:UIControlStateHighlighted];
    btn.size = btn.currentBackgroundImage.size;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];    
}
@end
