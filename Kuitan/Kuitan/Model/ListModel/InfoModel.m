//
//  InfoModel.m
//  Kuitan
//
//  Created by lanouhn on 15/10/18.
//  Copyright (c) 2015年 S&G. All rights reserved.
//

#import "InfoModel.h"

@implementation InfoModel
- (instancetype)initWithTitle:(NSString *)title Intro:(NSString *)intro UserName:(NSString *)name Time:(NSString *)time Avatar:(NSString *)avatar {
    self = [super init];
    if (self) {
        self.Title = title;
        self.Intro = intro;
        self.UserName = name;
        self.ReviewTime = time;
        self.Avatar = avatar;
    }
    return self;
}

- (instancetype)initWIthDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.Title = dic[@"Title"];
        self.Intro = dic[@"Intro"];
        self.UserName = dic[@"UserName"];
        self.ReviewTime = dic[@"ReviewTime"];
        self.Avatar = dic[@"Avatar"];
        self.CookTime = dic[@"CookTime"];
        self.UserCount = dic[@"UserCount"];
        self.Tips = dic[@"Tips"];
        self.Cover = dic[@"Cover"];
        self.Url = dic[@"Url"];
    }
    return self;
}

- (void)dealloc {
    self.Title = nil;
    self.Intro = nil;
    self.UserName = nil;
    self.ReviewTime = nil;
    self.Avatar = nil;
    self.CookTime = nil;
    self.UserCount = nil;
    self.Tips = nil;
    self.Cover = nil;
    self.Url = nil;
    [super dealloc];
}



@end
