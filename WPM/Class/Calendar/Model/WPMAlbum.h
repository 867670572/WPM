//
//  WPMAlbum.h
//  WPM
//
//  Created by Dream on 2017/10/31.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WPMAlbum : NSObject
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *diary;
@property(nonatomic,strong)NSString *diaryImgName;
-(id)initWithDate:(NSString *)date withDiary:(NSString *)diary withDiaryImgName:(NSString *)diaryImgName withStatus:(NSString *)status;
@end
