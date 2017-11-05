//
//  WPMPushController.h
//  WPM
//
//  Created by Dream on 2017/10/26.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "WPMPushAlbumController.h"
#import "WPMForHeaderView.h"
#import "WPMCalendarTableView.h"
@class WPMCalendarTableView;
typedef void(^returnIndex)(NSString *index);
@interface WPMPushController : BaseViewController
@property (nonatomic,copy) NSString *titles;
@property (nonatomic,copy) NSString *weekDayMonthYear;
@property (nonatomic,strong) WPMForHeaderView *headerView;
@property (nonatomic,strong) WPMCalendarTableView *tabAlbum;
@property (nonatomic,copy)returnIndex block;
@end
