//
//  WPMForHeaderView.h
//  WPM
//
//  Created by Dream on 2017/10/27.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPMCalenarWeekHeaderView.h"
#import "WPMSingleWeekView.h"
@interface WPMForHeaderView : UIView
@property(nonatomic,strong)WPMCalenarWeekHeaderView *hWeekHeadView;
@property(nonatomic,strong)WPMSingleWeekView *hDayHeadView;
@property(nonatomic,strong)UILabel *hWDMY;

- (id)initWithFrameAndSelectday:(CGRect)frame Selectday:(NSString *)selectday;
@end
