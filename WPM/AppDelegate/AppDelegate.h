//
//  AppDelegate.h
//  WPM
//
//  Created by 纬线 on 2017/10/24.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MainTabBarController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MainTabBarController *rootViewController;

@end

