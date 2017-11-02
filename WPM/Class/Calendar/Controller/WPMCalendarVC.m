//
//  WPMCalendarVC.m
//  WPM
//
//  Created by 纬线 on 2017/10/24.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMCalendarVC.h"
#import "WPMPushController.h"
#import "WPMCalendarView.h"
#import "WPMAlbumSearchVC.h"

@interface WPMCalendarVC ()

@end

@implementation WPMCalendarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addRightBtn];
    [self setupCalendar]; // 初始化日历对象
}

- (void)setupCalendar {
    
    CGFloat width = self.view.bounds.size.width - 20.0;
    CGPoint origin = CGPointMake(10.0, 64.0 + 80.0);
    
    // 传入Calendar的origin和width。自动计算控件高度
    WPMCalendarView *calendar = [[WPMCalendarView alloc] initWithFrameOrigin:origin width:width];
    
    
    // 点击某一天的回调
    calendar.didSelectDayHandler = ^(NSInteger year, NSInteger month, NSInteger day) {
        WPMPushController *pvc = [[WPMPushController alloc] init];
        
        NSString *YMD = [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day];
        
        NSString *weekday = [WPMCalendarVC weekdayStringFromDate:YMD];
        pvc.titles = [NSString stringWithFormat:@"%ld/%ld/%ld", day, month, year];
        NSString *monthStr = [NSString stringWithFormat:@"%ld",month];
        
        pvc.weekDayMonthYear = [NSString stringWithFormat:@"%@  %ld  %@  %ld",weekday,day,[WPMCalendarView changeM:monthStr],year];

        [self.navigationController pushViewController:pvc animated:YES];
    };
    [self.view addSubview:calendar];
}

//传入年月日得到星期几
+ (NSString *)weekdayStringFromDate:(NSString *)inputDateStr {
    //字符串转换成NSDate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *selectDate = [dateFormatter dateFromString:inputDateStr];
    //显示名称数组
    NSArray *weekdays = [NSArray arrayWithObjects:@" ",@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday",@"Saturday", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//时间   时区
//    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Guangzhou"];
//    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:selectDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}
- (void)addRightBtn {
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"SearchContactsBarIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)onClickedOKbtn {
    WPMAlbumSearchVC *ASVC = [[WPMAlbumSearchVC alloc] init];
    [self.navigationController pushViewController:ASVC animated:YES];
}

@end
