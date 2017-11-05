//
//  WPMCalendarTableView.m
//  WPM
//
//  Created by Dream on 2017/11/3.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import "WPMCalendarTableView.h"

@interface WPMCalendarTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *allKays;
}

@end

@implementation WPMCalendarTableView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //通过索引显示对应的cell
        _mArrSearchDate = nil;
        _albumModel = [[WPMAlbumModel alloc] init];
        allKays = [_albumModel.mdicAlbum allKeys];
        NSLog(@"%@",allKays);
        [self performSelector:@selector(blockClick) withObject:nil afterDelay:0.01];
        [self setupUI:frame];
    }
    return self;
}
- (void)setupUI:(CGRect)frame{
    _tabAlbum = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x - 10, frame.origin.y - 46, frame.size.width, frame.size.height) style:UITableViewStylePlain];
    self.backgroundColor = [UIColor clearColor];
    _tabAlbum.delegate = self;
    _tabAlbum.dataSource = self;
    _tabAlbum.backgroundColor = [UIColor clearColor];
    //取消显示分割线
    _tabAlbum.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self addSubview:_tabAlbum];
    
    
    
//    [_tabAlbum reloadData];
    
}
- (void)blockClick{
    for (int i = 0; i < allKays.count; i++) {
        //创建索引
        if ([_index isEqualToString:[allKays objectAtIndex:i]]) {
            _mArrSearchDate = [NSMutableArray array];
            _mArrSearchDate = [_albumModel.mdicAlbum objectForKey:[allKays objectAtIndex:i]];
            [_tabAlbum reloadData];
            break;
        }
    }
    NSLog(@"%@",_index);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *identifier = @"cell";
    WPMAlbumTVCell *cell = [_tabAlbum dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WPMAlbumTVCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    //选中不变色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    cell.backgroundColor = [UIColor clearColor];

//    cell.dateLabel.text = self.title;
//    cell.IDLabel.text = [NSString stringWithFormat:@"%ld\n\n",indexPath.section + 1];;
//
//    cell.IDLabel.textAlignment = NSTextAlignmentCenter;
//    cell.IDLabel.numberOfLines = 3;
//    cell.IDLabel.textColor = [UIColor whiteColor];
//    cell.photoIV.image = [UIImage imageNamed:[arrImageName objectAtIndex:indexPath.section]];
//    cell.statusLabel.text = arrStatus[indexPath.section];
//    cell.statusLabel.textAlignment = NSTextAlignmentRight;
//    cell.statusLabel.textColor = [UIColor whiteColor];
//
//    cell.dateLabel.textAlignment = NSTextAlignmentRight;
//    cell.dateLabel.textColor = [UIColor whiteColor];
    //创建相册对象
    _album = [_mArrSearchDate objectAtIndex:indexPath.section];
    cell.backgroundColor = [UIColor colorWithWhite:1  alpha:0.1];
    cell.IDLabel.text = [NSString stringWithFormat:@"%ld\n\n",indexPath.section + 1];;
    cell.IDLabel.backgroundColor = [UIColor redColor];
    cell.IDLabel.textAlignment = NSTextAlignmentCenter;
    cell.IDLabel.numberOfLines = 3;
    cell.IDLabel.textColor = [UIColor whiteColor];
    cell.photoIV.image = [UIImage imageNamed:_album.diaryImgName];
    cell.statusLabel.text = _album.status;
    cell.statusLabel.textAlignment = NSTextAlignmentRight;
    cell.statusLabel.textColor = [UIColor whiteColor];
    cell.dateLabel.text = _album.date;
    cell.dateLabel.textAlignment = NSTextAlignmentRight;
    cell.dateLabel.textColor = [UIColor whiteColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"%ld",_mArrSearchDate.count);
        return _mArrSearchDate.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _album = [_mArrSearchDate objectAtIndex:indexPath.section];
    if (self.block != nil) {
        self.block(_album.diaryImgName);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

//点击编辑按钮执行
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [self setEditing:editing animated:animated];
    //开启tab编辑
    [_tabAlbum setEditing:editing animated:animated];
}

- (void)tableView :(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /**   点击 删除 按钮的操作 */
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //        获取选中删除行索引值
        
        NSIndexSet *section = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        
        //        通过获取的索引值删除数组中的值
        
        [_mArrSearchDate removeObjectAtIndex:indexPath.section];
        //        删除单元格的某一行时，在用动画效果实现删除过程
        
        [_tabAlbum deleteSections:section withRowAnimation:UITableViewRowAnimationNone];
        [_tabAlbum reloadData];
    }
    
}


@end
