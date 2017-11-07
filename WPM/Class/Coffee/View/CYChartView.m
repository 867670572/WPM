//
//  CYChartView.m
//  coffee
//
//  Created by 刘文锋 on 2017/11/7.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "CYChartView.h"

@implementation CYChartView

-(void)drawRect:(CGRect)rect{
    UIColor *lineColor = [UIColor whiteColor];
    UIColor *currentColor = [UIColor colorWithRed:36/255.f green:162/255.f blue:153/255.f alpha:1];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    //2.勾勒图形
    [path1 moveToPoint:[self convertPointX:0 Y:_p1]];
    [path1 addLineToPoint:[self convertPointX:_t1 Y:_p1]];
    //[path addLineToPoint:CGPointMake(40, 40)];
    //[path closePath];
    
    
    
    //path的其它设置
    //设置线宽
    path1.lineWidth = 2;
    //设置线头的样式
    path1.lineCapStyle = kCGLineCapSquare;
    //设置线条连接处的样式
    path1.lineJoinStyle = kCGLineJoinRound;
    
    //3.设置描边和填充颜色
    if (_currentPath == 1) {
        [currentColor setStroke];
    }else{
        [lineColor setStroke];
    }
//    [[UIColor greenColor] setFill];
    
    //4.真的绘制
    [path1 stroke];
//    [path fill];
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:[self convertPointX:_t1 Y:_p2]];
    [path2 addLineToPoint:[self convertPointX:(_t1 + _t2) Y:_p2]];
    path2.lineWidth = 2;
    path2.lineCapStyle = kCGLineCapSquare;
    path2.lineJoinStyle = kCGLineJoinRound;
    if (_currentPath == 2) {
        [currentColor setStroke];
    }else{
        [lineColor setStroke];
    }
    [path2 stroke];
    
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:[self convertPointX:(_t1 + _t2) Y:_p3]];
    [path3 addLineToPoint:[self convertPointX:(_t1 + _t2 + _t3) Y:_p3]];
    path3.lineWidth = 2;
    path3.lineCapStyle = kCGLineCapSquare;
    path3.lineJoinStyle = kCGLineJoinRound;
    if (_currentPath == 3) {
        [currentColor setStroke];
    }else{
        [lineColor setStroke];
    }
    [path3 stroke];
    
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    [path4 moveToPoint:[self convertPointX:(_t1 + _t2 + _t3) Y:_p4]];
    [path4 addLineToPoint:[self convertPointX:(_t1 + _t2 + _t3 + _t4) Y:_p4]];
    path4.lineWidth = 2;
    path4.lineCapStyle = kCGLineCapSquare;
    path4.lineJoinStyle = kCGLineJoinRound;
    if (_currentPath == 4) {
        [currentColor setStroke];
    }else{
        [lineColor setStroke];
    }
    [path4 stroke];
    
    NSLog(@"x:%f",self.cPoint.x);
    if (self.cPoint.x) {
        
    }
    UIBezierPath *pathLine = [UIBezierPath bezierPath];
    [pathLine moveToPoint:[self convertPointX:_t1 Y:_p1]];
    [pathLine addLineToPoint:[self convertPointX:_t1 Y:_p2]];
    [pathLine moveToPoint:[self convertPointX:(_t1 + _t2) Y:_p2]];
    [pathLine addLineToPoint:[self convertPointX:(_t1 + _t2) Y:_p3]];
    [pathLine moveToPoint:[self convertPointX:(_t1 + _t2 + _t3) Y:_p3]];
    [pathLine addLineToPoint:[self convertPointX:(_t1 + _t2 + _t3) Y:_p4]];
    pathLine.lineWidth = 2;
    pathLine.lineCapStyle = kCGLineCapSquare;
    pathLine.lineJoinStyle = kCGLineJoinRound;
    [lineColor setStroke];
    [pathLine stroke];
    
    
    
    //x与 y 轴
    UIBezierPath *xyPath = [UIBezierPath bezierPath];

    [xyPath moveToPoint:CGPointMake(0, 0)];
    [xyPath addLineToPoint:CGPointMake(0, 140)];
    [xyPath addLineToPoint:CGPointMake(300, 140)];

    xyPath.lineWidth = 4;
    xyPath.lineCapStyle = kCGLineCapSquare;
    xyPath.lineJoinStyle = kCGLineJoinRound;
    [[UIColor whiteColor] setStroke];
    [xyPath stroke];
}
- (CGPoint)convertPointX:(CGFloat)x Y:(CGFloat)y{
    return CGPointMake(6.1*x, (7+0.5-y)*140/6.5);
}
@end
