//
//  CYProgressView.m
//  FreshGoods
//
//  Created by 陈誉 on 2017/9/29.
//  Copyright © 2017年 Huang WenGuang. All rights reserved.
//

#import "CYProgressView.h"
#define FrameHeight self.frame.size.height

@interface CYProgressView()
@property (nonatomic,weak) UIView *progressView;
@property (nonatomic,strong) UIImageView *imageView;

@end


@implementation CYProgressView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = self.frame.size.height/2;
        CGRect viewFrame = CGRectMake(0, 0, 0, frame.size.height);
//        UIView *view = [[UIView alloc] initWithFrame:viewFrame];
        UIImageView *view = [[UIImageView alloc] initWithFrame:viewFrame];
        view.image = [UIImage imageNamed:@"slider"];
        [self addSubview:view];
        self.progressView = view;
//        self.imageView =[[UIImageView alloc]initWithFrame:CGRectMake(-FrameHeight/2, -FrameHeight/2, FrameHeight*2, FrameHeight*2)];
//        self.imageView.image = [UIImage imageNamed:@"椭圆2"];
//        [self addSubview:self.imageView];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    if (progress == 0) {
        self.progressView.backgroundColor = [UIColor clearColor];
        CGRect frame = CGRectMake(0, 0, progress*self.frame.size.width, FrameHeight);
        [UIView animateWithDuration:0.5 animations:^{
            self.progressView.frame = frame;
            
            
        }];
    }else{
        self.progressView.backgroundColor = [UIColor whiteColor];
        CGRect frame = CGRectMake(0, 0, progress*self.frame.size.width, FrameHeight);
//        CGRect imageFrame = CGRectMake(progress*self.frame.size.width-FrameHeight, -FrameHeight/2, FrameHeight*2, FrameHeight*2);
        [UIView animateWithDuration:0.5 animations:^{
            self.progressView.frame = frame;
//            self.imageView.frame = imageFrame;

        }];
    }
    self.progressView.layer.cornerRadius = self.frame.size.height/2;
}


@end
