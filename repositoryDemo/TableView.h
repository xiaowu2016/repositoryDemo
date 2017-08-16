//
//  TableView.h
//  ZCButtonControl
//
//  Created by zhangchao on 16/5/23.
//  Copyright © 2016年 zhangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol viewDelegate <NSObject>

- (void)ShouldEnterDetailViewControllerWithItem:(id)item;

@end

typedef NS_ENUM(NSInteger,ShoppingType)
{
    ShoppingTypeQuoting, //求购中
    ShoppingTypeHistory, //历史
    ShoppingTypeFuture   //未来
};

@interface TableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) id<viewDelegate> myDelegate;
@property (nonatomic,assign) ShoppingType types;
@end
