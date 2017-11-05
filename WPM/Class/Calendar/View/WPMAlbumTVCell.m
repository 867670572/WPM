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
        [self setupCell];
    }
    return self;
}
- (void)setupCell{
    self.contentView.backgroundColor = [UIColor colorWithWhite:1  alpha:0.1];
    _IDLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/12, 80)];
    _IDLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_IDLabel];
    _photoIV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/12, 0, SCREEN_WIDTH/2.3, 80)];
    [self.contentView addSubview:_photoIV];
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 120, 10, 90, 18)];
    [self.contentView addSubview:_dateLabel];
    _statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 90, 45, 60, 20)];
    [self.contentView addSubview:_statusLabel];
    
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
//                    img.frame = CGRectMake(0, img.frame.origin.y, img.frame.size.width, img.frame.size.height);
//                    //我们在这里替换多选按钮的图片
//                    if (self.selected) {
//                        img.image=[UIImage imageNamed:@"logo"];
//                    }else
//                    {
//                        img.image=[UIImage imageNamed:@"fa-star-o"];
//                    }
//                }
//            }
//        }
//    }
//}

@end
