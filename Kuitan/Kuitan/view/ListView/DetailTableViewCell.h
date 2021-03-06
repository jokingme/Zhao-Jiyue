//
//  DetailTableViewCell.h
//  Kuitan
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 S&G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface DetailTableViewCell : UITableViewCell
@property (nonatomic,retain) UIImageView *coverImage;//菜品图片
@property (nonatomic,retain) UILabel *titleLabel;//菜名
@property (nonatomic,retain) UILabel *label1;//播放时长/收藏浏览
@property (nonatomic,retain) UILabel *stuffLabel;//菜品
@property (nonatomic,retain) UIImageView *videoImage;//视频图片
@property (nonatomic,retain) DetailModel *model;

@end
