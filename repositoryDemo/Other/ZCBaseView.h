//
//  ZCBaseView.h
//  ZCButtonControl
//
//  Created by zhangchao on 16/5/26.
//  Copyright © 2016年 zhangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBaseView : UIView
/**
 *  当前显示的视图
 */
@property (nonatomic,strong) UIView *currentView;
/**
 *  通过传入的标题名，页面，和frame来创建一个新的组合页面
 *
 *  @param title 标题名
 *  @param views 页面
 *  @param frame frame
 *
 *  @return 组合页面
 */
- (instancetype)initWithTitles:(NSArray *)titles AndViews:(NSArray *)views AtFrame:(CGRect)frame;
/**
 *  设置控件按钮部位的颜色
 *
 *  @param color 颜色
 */
- (void)setButtonViewBackgroundColor:(UIColor *)color;
/**
 *  跳转的时候是否添加动画
 *
 *  @param animated YES/NO
 */
- (void)setAnimated:(BOOL)animated;
@end
