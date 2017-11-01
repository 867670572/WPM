//
//  WPMCalendarCell.h
//  WPM
//
//  Created by Dream on 2017/10/25.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPMCalendarCell : UICollectionViewCell

@property (nonatomic, strong) UIView *todayCircle; //!< 标示'今天'
@property (nonatomic, strong) UILabel *todayLabel; //!< 标示日期（几号）
@property (nonatomic, strong) UIView *pointView; //!< 标示该天具备提醒

@end
