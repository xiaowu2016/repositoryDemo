//
//  ZCBaseControl.h
//  ZCButtonControl
//
//  Created by zhangchao on 16/5/23.
//  Copyright © 2016年 zhangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBaseControl : UIControl
@property (nonatomic,assign) NSInteger selectIndex;
@property (nonatomic,assign) NSInteger count;

- (instancetype)initWithTitles:(NSArray *)titles;
@end
