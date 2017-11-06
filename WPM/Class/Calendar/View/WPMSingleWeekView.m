//
//  WPMSingleWeekView.m
//  WPM
//
//  Created by Dream on 2017/10/28.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMSingleWeekView.h"
@interface WPMSingleWeekView()
{
    NSMutableArray *mArrSingleWeed;
}


@end


@implementation WPMSingleWeekView

- (id)initWithFrameAndSelectday:(CGRect)frame Selectday:(NSString *)selectday {
    self = [super initWithFrame:frame];
    if (self) {
        mArrSingleWeed = [NSMutableArray array];
        CGFloat height = frame.size.height;
        CGFloat width = (SCREEN_WIDTH - 20) / 7.0;
        _singleWeekView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        [self addSubview:_singleWeekView];
        UILabel *label;
        for (int i = 0; i < 7; ++i) {
            label = [[UILabel alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
            label.backgroundColor = [UIColor clearColor];
            label.tag = i;
            [mArrSingleWeed addObject:label];
            label.font = [UIFont fontWithName:@"PingFang SC" size:13.5];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
        }
        [self labelShowdataWithNowDate:selectday frame:frame];
        for (int i = 0; i < 7; ++i) {
            UILabel *label1 = [mArrSingleWeed objectAtIndex:i];
            [_singleWeekView addSubview:label1];
      }
        
    }
    return self;
}
//tag转str
- (NSString *)tagChangeStr:(NSInteger)tag{
    switch (tag) {
        case 1:
            return @"Monday";
            break;
        case 2:
            return @"Tuesday";
            break;
        case 3:
            return @"Wednesday";
            break;
        case 4:
            return @"Thursday";
            break;
        case 5:
            return @"Friday";
            break;
        case 6:
            return @"Saturday";
            break;
        default:
            return @"Sunday";
            break;
    }
}
//在日/月/年格式中  转换 提取日  月  年
- (NSArray *)dateChangeStr:(NSString *)str{
    NSString *day = [str substringToIndex:2];
    NSString *month = [str substringWithRange:NSMakeRange(3, 2)];
    NSString *year = [str substringFromIndex:6];
    BOOL boolDay = [day containsString:@"/"];
    BOOL boolMonthEnd = [month hasSuffix:@"/"];
    BOOL boolMonthFirst = [month hasPrefix:@"/"];
    //如果日是单数月是双数时
    if (boolDay&&boolMonthEnd) {
        day = [str substringToIndex:1];
        month = [str substringWithRange:NSMakeRange(2, 2)];
        year = [str substringFromIndex:5];
    }
    //如果日和月都是单数时
    if (boolMonthFirst) {
        day = [str substringToIndex:1];
        month = [str substringWithRange:NSMakeRange(2, 1)];
        year = [str substringFromIndex:4];
    }
    //如果月是单数日是双数时
    if ((!boolDay)&&boolMonthEnd) {
        month = [str substringWithRange:NSMakeRange(3, 1)];
        year = [str substringFromIndex:5];
    }
    NSString *YMD = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
    NSArray *dayData = [NSArray arrayWithObjects:YMD,year,month,day, nil];
    return dayData;
}

//nowDay == selectday == 日/月/年
//控制label显示该显示的数据
- (void)labelShowdataWithNowDate:(NSString*)nowDate frame:(CGRect)frame{
    CGFloat height = frame.size.height;
    CGFloat width = (SCREEN_WIDTH - 20) / 7.0;
    //标志今天小圆点
    UIView *pointView = [[UIView alloc] init];
    pointView.layer.cornerRadius = 0.5 * (height-14);
    pointView.backgroundColor = HEXCOLOR(0x19A79D);
    //字符串格式转换
    //年-月-日
    NSString *selectdayD = [self dateChangeStr:nowDate][0];
    //得到对应的周几
    NSString *selectdayWD = [WPMCalendarVC weekdayStringFromDate:selectdayD];
    //选中的日期的年月日
    NSString *nowYear = [self dateChangeStr:nowDate][1];
    NSString *nowMonth = [self dateChangeStr:nowDate][2];
    NSString *nowDay = [self dateChangeStr:nowDate][3];

    int nowDayInt = [nowDay intValue];
    NSInteger tag = 0;
    if ([selectdayWD isEqualToString:@"Sunday"]) {
        tag = 0;
    }
    if ([selectdayWD isEqualToString:@"Monday"]) {
        tag = 1;
    }
    if ([selectdayWD isEqualToString:@"Tuesday"]) {
        tag = 2;
    }
    if ([selectdayWD isEqualToString:@"Wednesday"]) {
        tag = 3;
    }
    if ([selectdayWD isEqualToString:@"Thursday"]) {
        tag = 4;
    }
    if ([selectdayWD isEqualToString:@"Friday"]) {
        tag = 5;
    }
    if ([selectdayWD isEqualToString:@"Saturday"]) {
        tag = 6;
    }
    pointView.frame = CGRectMake(tag * width+(width-height+14)*0.5, 7 ,height-14,height-14);
    [_singleWeekView addSubview:pointView];
    //创建label接收数组中的label
    UILabel *label0 = [mArrSingleWeed objectAtIndex:0];
    UILabel *label1 = [mArrSingleWeed objectAtIndex:1];
    UILabel *label2 = [mArrSingleWeed objectAtIndex:2];
    UILabel *label3 = [mArrSingleWeed objectAtIndex:3];
    UILabel *label4 = [mArrSingleWeed objectAtIndex:4];
    UILabel *label5 = [mArrSingleWeed objectAtIndex:5];
    UILabel *label6 = [mArrSingleWeed objectAtIndex:6];
    int dayInt = nowDayInt;
    NSString *str;
    NSMutableArray *mArrDay = [NSMutableArray array];
    if (tag == 0) {
        //第一位
        dayInt = nowDayInt - 0;
        if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
            str = @"\t";
            [mArrDay addObject:str];
        }else{
            str = [NSString stringWithFormat:@"%d",dayInt];
            [mArrDay addObject:str];
        }
        //后面六位
        for (int i = 1; i < 7; i++) {
            dayInt = dayInt + 1;
            if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
                str = @"\t";
                [mArrDay addObject:str];
            }else{
                str = [NSString stringWithFormat:@"%d",dayInt];
                [mArrDay addObject:str];
            }
        }
    }
    if (tag == 1) {
        //第一位
        dayInt = nowDayInt - 1;
        if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
            str = @"\t";
            [mArrDay addObject:str];
        }else{
            str = [NSString stringWithFormat:@"%d",dayInt];
            [mArrDay addObject:str];
        }
        //后面六位
        for (int i = 1; i < 7; i++) {
            dayInt = dayInt + 1;
            if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
                str = @"\t";
                [mArrDay addObject:str];
            }else{
                str = [NSString stringWithFormat:@"%d",dayInt];
                [mArrDay addObject:str];
            }
        }
    }
    if (tag == 2) {
        //第一位
        dayInt = nowDayInt - 2;
        if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
            str = @"\t";
            [mArrDay addObject:str];
        }else{
            str = [NSString stringWithFormat:@"%d",dayInt];
            [mArrDay addObject:str];
        }
        //后面六位
        for (int i = 1; i < 7; i++) {
            dayInt = dayInt + 1;
            if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
                str = @"\t";
                [mArrDay addObject:str];
            }else{
                str = [NSString stringWithFormat:@"%d",dayInt];
                [mArrDay addObject:str];
            }
        }
    }
    if (tag == 3) {
        //第一位
        dayInt = nowDayInt - 3;
        if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
            str = @"\t";
            [mArrDay addObject:str];
        }else{
            str = [NSString stringWithFormat:@"%d",dayInt];
            [mArrDay addObject:str];
        }
        //后面六位
        for (int i = 1; i < 7; i++) {
            dayInt = dayInt + 1;
            if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
                str = @"\t";
                [mArrDay addObject:str];
            }else{
                str = [NSString stringWithFormat:@"%d",dayInt];
                [mArrDay addObject:str];
            }
        }
    }
    if (tag == 4) {
        //第一位
        dayInt = nowDayInt - 4;
        if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
            str = @"\t";
            [mArrDay addObject:str];
        }else{
            str = [NSString stringWithFormat:@"%d",dayInt];
            [mArrDay addObject:str];
        }
        //后面六位
        for (int i = 1; i < 7; i++) {
            dayInt = dayInt + 1;
            if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
                str = @"\t";
                [mArrDay addObject:str];
            }else{
                str = [NSString stringWithFormat:@"%d",dayInt];
                [mArrDay addObject:str];
            }
        }
    }
    if (tag == 5) {
        //第一位
        dayInt = nowDayInt - 5;
        if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
            str = @"\t";
            [mArrDay addObject:str];
        }else{
            str = [NSString stringWithFormat:@"%d",dayInt];
            [mArrDay addObject:str];
        }
        //后面六位
        for (int i = 1; i < 7; i++) {
            dayInt = dayInt + 1;
            if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
                str = @"\t";
                [mArrDay addObject:str];
            }else{
                str = [NSString stringWithFormat:@"%d",dayInt];
                [mArrDay addObject:str];
            }
        }
    }
    if (tag == 6) {
        //第一位
        dayInt = nowDayInt - 6;
        if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
            str = @"\t";
            [mArrDay addObject:str];
        }else{
            str = [NSString stringWithFormat:@"%d",dayInt];
            [mArrDay addObject:str];
        }
        //后面六位
        for (int i = 1; i < 7; i++) {
            dayInt = dayInt + 1;
            if (dayInt < 1 || dayInt > [self howManyDaysInThisYear:nowYear withMonth:nowMonth]){
                str = @"\t";
                [mArrDay addObject:str];
            }else{
                str = [NSString stringWithFormat:@"%d",dayInt];
                [mArrDay addObject:str];
            }
        }
    }
    label0.text = [mArrDay objectAtIndex:0];
    label1.text = [mArrDay objectAtIndex:1];
    label2.text = [mArrDay objectAtIndex:2];
    label3.text = [mArrDay objectAtIndex:3];
    label4.text = [mArrDay objectAtIndex:4];
    label5.text = [mArrDay objectAtIndex:5];
    label6.text = [mArrDay objectAtIndex:6];
    [mArrDay removeAllObjects];
}

//获取某年某月的天数
- (int)howManyDaysInThisYear:(NSString *)year withMonth:(NSString *)month{
    //将str转为int
    int _year = [year intValue];
    int _month = [month intValue];
    if((_month == 1) || (_month == 3) || (_month == 5) || (_month == 7) || (_month == 8) || (_month == 10) || (_month == 12))
        return 31 ;
    if((_month == 4) || (_month == 6) || (_month == 9) || (_month == 11))
        return 30;
    if((_year % 4 == 1) || (_year % 4 == 2) || (_year % 4 == 3))
    {
        return 28;
    }
    if(_year % 400 == 0)
        return 29;
    if(_year % 100 == 0)
        return 28;
    return 29;
}

@end



