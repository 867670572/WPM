//
//  BaseViewController.h
//  WPM
//
//  Created by 纬线 on 2017/10/24.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController

//是否显示navigationBar
@property (nonatomic) BOOL canShowNavBar;

//是否显示navigationBarBackItem
@property (nonatomic) BOOL canShowNavBackItem;
@property (nonatomic) BOOL canShowNavRightItem;
@property (nonatomic, strong) UIButton *backBtn;

//设置右item
//- (void)setRightNavigationItem;

//设置返回item
- (void)setNavBackButtonItem;

- (IBAction)navBackBtnClick:(id)sender;


- (void)popToLastVC;
@end

