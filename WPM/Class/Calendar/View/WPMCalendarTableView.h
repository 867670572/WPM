//
//  WPMCalendarTableView.h
//  WPM
//
//  Created by Dream on 2017/11/3.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPMAlbumTVCell.h"
#import "WPMPushController.h"
#import "WPMAlbumModel.h"
#import "WPMAlbum.h"

@class WPMPushController;
////别名(申明) 类型 ----> void (^) (NSString *text)
typedef void(^imgNameBlock) (NSString *imgName);
typedef void(^returnTitiles) (NSString *titles);
@interface WPMCalendarTableView : UIView

@property (nonatomic,strong)WPMPushController *PCV;
@property (nonatomic,strong) UITableView *tabAlbum;
@property (nonatomic,copy) imgNameBlock block;
//@property (nonatomic,copy)returnTitiles block;
@property (nonatomic,copy)NSString *index;
@property(nonatomic,strong)WPMAlbumModel *albumModel;
@property(nonatomic,strong)WPMAlbum *album;
@property(nonatomic,strong)NSMutableArray *mArrSearchDate;

@end
