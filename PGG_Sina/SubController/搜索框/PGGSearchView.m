//
//  PGGSearchView.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/14.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//代码地址 https://github.com/penghero/PGG_Sina.git

#import "PGGSearchView.h"
#import "UIView+PGGExtension.h"

@implementation PGGSearchView

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.placeholder = @"大家正在搜索:https://github.com/penghero";
        self.font = [UIFont systemFontOfSize:13];
        UIImageView *searchIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        searchIcon.width = 30;
        searchIcon.height = 30;
        self.leftView = searchIcon;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}
+(instancetype)searchBar {
    return [[self alloc]init];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
