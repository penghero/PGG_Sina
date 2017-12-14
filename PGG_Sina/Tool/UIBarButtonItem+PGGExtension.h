//
//  UIBarButtonItem+PGGExtension.h
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/14.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (PGGExtension)
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image heighlightImage:(NSString *)heilightImage;
@end
