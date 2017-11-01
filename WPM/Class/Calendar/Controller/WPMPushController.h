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

@interface WPMPushController : BaseViewController
@property (nonatomic, copy) NSString *titles;
@property (nonatomic, copy) NSString *weekDayMonthYear;
@property (nonatomic, strong) WPMPushAlbumController *PAC;

@end
