//
//  Xqmodel.m
//  ceshi
//
//  Created by lanouhn on 15/10/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Xqmodel.h"

@implementation Xqmodel
-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (instancetype)initWithImage:(NSString *)image
                    headphoto:(NSString*)headerphoto
                     nickname:(NSString*)nickname
                        title:(NSString*)title
                      content:(NSString*)content
{
    self = [super self];
    if (self)
    {
        self.image = image;
        self.headphoto = headerphoto;
        self.nickname = nickname;
        self.title = title;
        self.content = content;
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

- (void)dealloc {
    self.image = nil;
    self.headphoto = nil;
    self.nickname = nil;
    self.title = nil;
    self.content = nil;
    [super dealloc];
}

@end
