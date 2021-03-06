//
//  MovieStepViewController.h
//  Kuitan
//
//  Created by lanouhn on 15/10/17.
//  Copyright (c) 2015年 S&G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "DetailModel.h"

@interface MovieStepViewController : UIViewController
@property (nonatomic,copy) NSString *recipedId;
@property (nonatomic,retain) DetailModel *receiveModel;
@property (nonatomic,copy) NSString *text;
@end
