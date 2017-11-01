//
//  WPMAlbum.m
//  WPM
//
//  Created by Dream on 2017/10/31.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMAlbum.h"

@implementation WPMAlbum
-(id)initWithDate:(NSString *)date withDiary:(NSString *)diary withDiaryImage:(UIImage *)diaryImage withStatus:(NSString *)status{
    self = [super init];
    if (self) {
        _date = date;
        _diary = diary;
        _diaryImage = diaryImage;
        _status = status;
    }
    return self;
}
@end
//
//  WPMAlbunModel.m
//  WPM
//
//  Created by Dream on 2017/10/31.
//  Copyright © 2017年 linfun. All rights reserved.
//


