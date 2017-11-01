//
//  WPMSingleWeekView.h
//  WPM
//
//  Created by Dream on 2017/10/28.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPMCalendarVC.h"

@interface WPMSingleWeekView : UIView

@property (nonatomic,strong)UIView *singleWeekView;
@property (nonatomic,strong)UILabel *dayLable;

- (id)initWithFrameAndSelectday:(CGRect)frame Selectday:(NSString *)selectday;

@end
