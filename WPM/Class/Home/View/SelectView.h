//
//  SelectView.h
//  WPM
//
//  Created by Dream on 2017/11/2.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectView : UIView

@property(nonatomic,strong)UITableView *tabMachine;
@property(nonatomic,strong)UIButton *connectBtn;
@property(nonatomic,strong)UIButton *selectBtn;
@property(nonatomic,strong)NSMutableArray *mArrSelectBtn;
@property(nonatomic,strong)UIButton *refreshBtn;
@end
