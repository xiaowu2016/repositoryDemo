//
//  ZCBaseControl.m
//  ZCButtonControl
//
//  Created by zhangchao on 16/5/23.
//  Copyright © 2016年 zhangchao. All rights reserved.
//

#import "ZCBaseControl.h"
#import "UIView+Masonry_ZC.h"
#import "Masonry.h"

@interface ZCBaseControl ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView *squreView;
@end

@implementation ZCBaseControl
- (instancetype)initWithTitles:(NSArray *)titles
{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _squreView = [UIImageView new];
        _squreView.backgroundColor =[UIColor blueColor];
        [self addSubview:_squreView];
        
        self.count = titles.count;
        
        NSMutableArray *btns = [NSMutableArray array];
        for (int i = 0; i < titles.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            btn.tag = i+1;
            [btn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [btns addObject:btn];
        }
        
        [self distributeSpacingHorizontallyWith:btns];
    }
    return self;
}

#pragma mark - action
- (void)selectAction:(UIButton *)btn
{
    for (int i = 1; i < self.count+1; i++) {
        
        UIButton *botton = (UIButton *)[self viewWithTag:i];
        botton.selected = NO;
    }
    
    btn.selected = YES;
    
    NSDictionary *attrs = @{NSFontAttributeName : btn.titleLabel.font};
    //设置字体矩形框大小
    CGSize nameMaxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    //调用系统方法得到字体所占位置大小
    CGFloat width = [btn.titleLabel.text boundingRectWithSize:nameMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;

    [_squreView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self);
        make.height.mas_equalTo(@ 2);
        make.centerX.equalTo(btn);
        make.width.mas_equalTo(width + 10);
    }];
    
    [self layoutIfNeeded];
    
    _selectIndex = btn.tag - 1;
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex = selectIndex;
    
    UIButton *btn = [self viewWithTag:selectIndex + 1];
    [self selectAction:btn];
}

@end
