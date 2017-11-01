//
//  WPMAlbumTVCell.m
//  WPM
//
//  Created by Dream on 2017/10/26.
//  Copyright © 2017年 linfun. All rights reserved.
//

#import "WPMAlbumTVCell.h"


@implementation WPMAlbumTVCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _IDLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 25, 85)];
        [self addSubview:_IDLabel];
        _photoIV = [[UIImageView alloc]initWithFrame:CGRectMake(25, 0, 200, 85)];
        [self addSubview:_photoIV];
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 120, 10, 90, 18)];
        [self addSubview:_dateLabel];
        _statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 90, 45, 60, 20)];
        [self addSubview:_statusLabel];
    }
    return self;
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x += 10;
    frame.origin.y += 15;
    frame.size.height -= 15;
    frame.size.width -= 20;
    [super setFrame:frame];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (void)setEditing:(BOOL)editing animated:(BOOL)animated
//{
//    [super setEditing:editing animated:animated];
//    if (editing) {
//        [self customMultipleChioce];
//    }
//}
//
//-(void)layoutSubviews
//{
//    [self customMultipleChioce];
//    [super layoutSubviews];
//}
//
//-(void)customMultipleChioce{
//    for (UIControl *control in self.subviews){
//        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
//            for (UIView *view in control.subviews)
//            {
//                if ([view isKindOfClass: [UIImageView class]]) {
//                    UIImageView *img=(UIImageView *)view;
//                    //系统默认的横坐标为12，这里我们设定为20，everybody happy!
//                    img.frame = CGRectMake(20, img.frame.origin.y, img.frame.size.width, img.frame.size.height);
//                    //我们在这里替换多选按钮的图片
//                    if (self.selected) {
//                        img.image=[UIImage imageNamed:@"选中了"];
//                    }else
//                    {
//                        img.image=[UIImage imageNamed:@"没选中"];
//                    }
//                }
//            }
//        }
//    }
//}

@end
