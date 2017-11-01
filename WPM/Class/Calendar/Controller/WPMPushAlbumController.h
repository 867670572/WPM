//
//  WPMPushAlbumController.h
//  WPM
//
//  Created by Dream on 2017/10/30.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface WPMPushAlbumController : BaseViewController

@property(nonatomic,copy)NSString *imgName;
@property(nonatomic,strong)NSString *text;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UITextView *textView;
@end
