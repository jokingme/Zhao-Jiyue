//
//  ImageModel.m
//  Kuitan
//
//  Created by laouhn on 15/10/18.
//  Copyright (c) 2015年 S&G. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)ImageModelWithDictionary:(NSDictionary *)dic {
    return [[self alloc] initWithDictionary:dic];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)dealloc {
    self.title = nil;
    self.image = nil;
    self.dishes_id = nil;
    [super dealloc];
}

@end
