//
//  WPMAlbumSearchVCViewController.h
//  WPM
//
//  Created by Dream on 2017/10/30.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPMAlbumTVCell.h"

#import "BaseViewController.h"
#import "WPMCalendarTableView.h"

@interface WPMAlbumSearchVC : BaseViewController

@property(nonatomic,strong)UITextField *searchTF;
@property(nonatomic,strong)UIButton *searchBtn;



@property(nonatomic,strong)WPMCalendarTableView *tabAlbum;

@end
