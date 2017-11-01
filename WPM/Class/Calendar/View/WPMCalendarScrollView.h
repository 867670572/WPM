//
//  WPMCalendarScrollView.h
//  WPM 
//
//  Created by Dream on 2017/10/25.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义回调Block
typedef void (^DidSelectDayHandler)(NSInteger, NSInteger, NSInteger);
@interface WPMCalendarScrollView : UIScrollView

@property (nonatomic, copy) DidSelectDayHandler didSelectDayHandler; // 日期点击回调

- (void)refreshToCurrentMonth; // 刷新 calendar 回到当前日期月份

@end
