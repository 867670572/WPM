#import "WPMAlbumModel.h"
#import "WPMAlbum.h"
@implementation WPMAlbumModel
- (id)init{
    self = [super init];
    if (self) {
        _mdicAlbum = [NSMutableDictionary dictionary];
        
        //存对象,按时间顺序
        NSMutableArray *mArrAlbumDate = [NSMutableArray array];
        
        [_mdicAlbum setObject:mArrAlbumDate forKey:@"23/10/2017"];
        
        NSMutableArray *arrDate = [NSMutableArray array];
        
        NSMutableArray *arrDiary = [NSMutableArray array];
        
        NSMutableArray *arrImageName = [NSMutableArray array];
        
        NSMutableArray *arrStatus = [NSMutableArray array];
        
        [arrDate addObject:@"23/10/2017"];
        [arrDate addObject:@"23/10/2017"];
        [arrDate addObject:@"23/10/2017"];
        [arrDate addObject:@"23/10/2017"];
        [arrDate addObject:@"23/10/2017"];
        
        [arrStatus addObject:@"strong"];
        [arrStatus addObject:@"strong"];
        [arrStatus addObject:@"strong"];
        [arrStatus addObject:@"strong"];
        [arrStatus addObject:@"strong"];
        
        [arrDiary addObject:@"垃圾"];
        [arrDiary addObject:@"垃圾"];
        [arrDiary addObject:@"垃圾"];
        [arrDiary addObject:@"垃圾"];
        [arrDiary addObject:@"垃圾"];
        
        [arrImageName addObject:@"0"];
        [arrImageName addObject:@"1"];
        [arrImageName addObject:@"2"];
        [arrImageName addObject:@"3"];
        [arrImageName addObject:@"4"];
        
        
        
        for (int i = 0; i<arrDate.count; i++) {
            WPMAlbum *album = [[WPMAlbum alloc] initWithDate:[arrDate objectAtIndex:i] withDiary:[arrDiary objectAtIndex:i] withDiaryImage:[arrImageName objectAtIndex:i] withStatus:[arrStatus objectAtIndex:i]];
            [mArrAlbumDate addObject:album];
        }
        
        
    }
    return self;
}

@end
