//
//  WPMCalendarView.m
//  WPM
//
//  Created by Dream on 2017/10/25.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMCalendarView.h"
#import "WPMCalendarScrollView.h"
#import "NSDate+WPMCalendar.h"
#import "WPMCalenarWeekHeaderView.h"

@interface WPMCalendarView()

/** 顶部条 年-月 && 今 */
@property (nonatomic, strong) UIView *topYearMonthView;
/** 顶部条 “2017年 10月” button */
@property (nonatomic, strong) UILabel *calendarHeaderLabelY;
@property (nonatomic, strong) UILabel *calendarHeaderLabelM;
/** 顶部条 “今” button */
@property (nonatomic, strong) UIButton *todayButton;
/** 星期条 */
@property (nonatomic, strong) WPMCalenarWeekHeaderView *weekHeaderView;
/** 日历主体 */
@property (nonatomic, strong) WPMCalendarScrollView *calendarScrollView;

@end



@implementation WPMCalendarView


#pragma mark - Initialization

- (instancetype)initWithFrameOrigin:(CGPoint)origin width:(CGFloat)width {
    
    // 根据宽度计算 calender 主体部分的高度
    CGFloat weekLineHight = 0.85 * (width / 7.0); //  一行的高度
    CGFloat monthHeight = 6 * weekLineHight; // 主体部分整体高度
    
    // 星期头部栏高度
    CGFloat weekHeaderHeight = weekLineHight;
    
    // calendar 头部栏高度
    CGFloat calendarHeaderHeight = weekLineHight ;
    
    // 最后得到整个 calender 控件的高度
    _calendarHeight = calendarHeaderHeight + weekHeaderHeight + monthHeight + 20;
    
    if (self = [super initWithFrame:CGRectMake(origin.x, origin.y, width, _calendarHeight)]) {
        
        //        self.layer.masksToBounds = YES;
        //        // 整体边框颜色
        //        self.layer.borderColor = HEXCOLOR(0xEEEEEE).CGColor;
        //        self.layer.borderWidth = 2.0 / [UIScreen mainScreen].scale;
        //        self.layer.cornerRadius = 8.0;
        
        // 顶部 2017年10月按钮 单击跳转到当前月份
        _topYearMonthView = [self setupCalendarHeaderWithFrame:CGRectMake(0.0, 0.0, width, calendarHeaderHeight)];
        // 顶部 日 一 二 三 四 五 六 view星期条
        _weekHeaderView = [[WPMCalenarWeekHeaderView alloc] initWithFrame:CGRectMake(0.0, calendarHeaderHeight , width, weekHeaderHeight)];
        _weekHeaderView.backgroundColor =[UIColor colorWithWhite:1  alpha:0.1];
        // 底部月历滚动scroll
        _calendarScrollView = [self setupCalendarScrollViewWithFrame:CGRectMake(0.0, calendarHeaderHeight + weekHeaderHeight + 20, width, monthHeight)];
        
        [self addSubview:_topYearMonthView];
        [self addSubview:_weekHeaderView];
        [self addSubview:_calendarScrollView];
        
        // 注册 Notification 监听
        [self addNotificationObserver];
        
    }
    
    return self;
    
}

- (void)dealloc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/** 设置顶部条，显示 年-月 的 */
- (UIView *)setupCalendarHeaderWithFrame:(CGRect)frame {
    
    UIView *backView = [[UIView alloc] initWithFrame:frame];
    backView.backgroundColor = [UIColor clearColor];
    
    //头部年份
    UILabel *yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, frame.size.height)];
    _calendarHeaderLabelY = yearLabel;
    yearLabel.backgroundColor = [UIColor clearColor];
    [yearLabel setTextColor:[UIColor whiteColor]];
    [yearLabel setFont:[UIFont fontWithName:@"PingFang SC" size:16]];
    [backView addSubview:yearLabel];
    //头部月份
    UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 90, 0, 85, frame.size.height)];
    _calendarHeaderLabelM = monthLabel;
    monthLabel.backgroundColor = [UIColor clearColor];
    [monthLabel setTextColor:[UIColor whiteColor]];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    [monthLabel setFont:[UIFont fontWithName:@"PingFang SC" size:16]];
    [backView addSubview:monthLabel];
    
    UIButton *todayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    todayButton.frame = CGRectMake(100,7, frame.size.height - 14, frame.size.height - 14);
    [todayButton setTitle:@"今" forState:UIControlStateNormal];
    [todayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    todayButton.backgroundColor = HEXCOLOR(0xFF5A39);
    todayButton.layer.cornerRadius = todayButton.frame.size.width * 0.5;
    [todayButton addTarget:self action:@selector(refreshToCurrentMonthAction:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:todayButton];
    
    return backView;
}

/** 设置底部滚动日历 */
- (WPMCalendarScrollView *)setupCalendarScrollViewWithFrame:(CGRect)frame {
    // 构造方法
    WPMCalendarScrollView *scrollView = [[WPMCalendarScrollView alloc] initWithFrame:frame];
    return scrollView;
}

/** 重写block回调方法 */
- (void)setDidSelectDayHandler:(DidSelectDayHandler)didSelectDayHandler {
    _didSelectDayHandler = didSelectDayHandler;
    if (_calendarScrollView != nil) {
        _calendarScrollView.didSelectDayHandler = _didSelectDayHandler; // 传递 block（将日历中日期点击之后得到的对应数据返回给CalendarView）
        // 由于_calendarScrollView 的 block 是由外层的 CalendarView 传给他的，所以说当这个 block 有回调之后，外面的 CalendarView 的 block 也就有了回调结果。所以说控制器就可以拿到了。这是属于指针之间的传递。
    }
}

/** 添加通知的接收 */
- (void)addNotificationObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCalendarHeaderAction:) name:@"ChangeCalendarHeaderNotification" object:nil];
}


#pragma mark - Actions
/** 改变 顶部年月栏 的日期显示 && 滚动到当前月份 */
- (void)refreshToCurrentMonthAction:(UIButton *)sender {
    
    // 设置显示日期
    NSInteger year = [[NSDate date] dateYear];
    NSInteger month = [[NSDate date] dateMonth];
    
    NSString *titleY = [NSString stringWithFormat:@"%d", (int)year];
    NSString *titleM = [NSString stringWithFormat:@"%d", (int)month];
    _calendarHeaderLabelY.text = titleY;
    _calendarHeaderLabelM.text = [WPMCalendarView changeM:titleM];
    
    // 进行滑动
    [_calendarScrollView refreshToCurrentMonth];
    
}

// 接收通知传递回来的数据（包装在sender.userInfo里面）
- (void)changeCalendarHeaderAction:(NSNotification *)sender {
    
    NSDictionary *dic = sender.userInfo;
    
    NSNumber *year = dic[@"year"];
    NSNumber *month = dic[@"month"];
    
    NSString *titleY = [NSString stringWithFormat:@"%@", year];
    NSString *titleM = [NSString stringWithFormat:@"%@", month];
    
    
    _calendarHeaderLabelY.text = titleY;
    _calendarHeaderLabelM.text = [WPMCalendarView changeM:titleM];
}

// 月份装换
+ (NSString *)changeM:(NSString *)mouthNum{
    int mouth = [mouthNum intValue];
    switch (mouth) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        default:
            return @"December";
            break;
    }
}
@end

