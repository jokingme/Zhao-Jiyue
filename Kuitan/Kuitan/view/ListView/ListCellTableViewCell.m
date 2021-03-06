//
//  ListCellTableViewCell.m
//  Kuitan
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 S&G. All rights reserved.
//
#import "ListCellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MeiShi.h"

@implementation ListCellTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.button1 addSubview:self.photoImage];
        [self.button1 addSubview:self.jiantou];
        [self.button1 addSubview:self.titleLabel];
        [self.contentView addSubview:self.button1];
        [self.contentView addSubview:self.button2];
        [self.contentView addSubview:self.button3];
        [self.contentView addSubview:self.button4];
        [self.contentView addSubview:self.button5];
        [self.contentView addSubview:self.button6];
        [self.contentView addSubview:self.button7];
    }
    return self;
}

- (UIButton *)button1 {
    if (!_button1) {
        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button1.frame = CGRectMake(0, 0, (WIDTH - 40) / 3, (WIDTH - 40) / 3);
        _button1.tag = 101;
    }
    return _button1;
}

- (UIImageView *)photoImage {
    if (!_photoImage) {
        self.photoImage = [[[UIImageView alloc] initWithFrame:CGRectMake((WIDTH - 40) / 15, (WIDTH - 40) / 30, (WIDTH - 40) / 6, (WIDTH - 40) / 6)] autorelease];
    }
    return [[_photoImage retain] autorelease];
}

- (UIImageView *)jiantou {
    if (!_jiantou) {
        self.jiantou = [[[UIImageView alloc] initWithFrame:CGRectMake((WIDTH - 40) * 7 / 30, (WIDTH - 40) / 10, (WIDTH - 40) / 15, (WIDTH - 40) / 10)] autorelease];
        _jiantou.image = [UIImage imageNamed:@"iconfont-iconleft(1)"];
    }
    return  [[_jiantou retain] autorelease];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake((WIDTH - 40) / 30, (WIDTH - 40) / 5, (WIDTH - 40) * 8 / 30, (WIDTH - 40) / 10)] autorelease];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return  [[_titleLabel retain] autorelease];
}

- (UIButton *)button2 {
    if (!_button2) {
        self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button2.frame = CGRectMake((WIDTH - 40) / 3 + 10, (WIDTH - 40) * 2 / 45, (WIDTH - 40) * 2 / 9, (WIDTH - 40) / 9);
        _button2.tag = 102;
        [_button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button2;
}

- (UIButton *)button3 {
    if (!_button3) {
        self.button3 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button3.frame = CGRectMake((WIDTH - 40) / 3 + 10 + (10 + (WIDTH - 40) * 2 / 9) * 1, (WIDTH - 40) * 2 / 45, (WIDTH - 40) * 2 / 9, (WIDTH - 40) / 9);
        _button3.tag = 103;
        [_button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button3;
}

- (UIButton *)button4 {
    if (!_button4) {
        self.button4 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button4.frame = CGRectMake((WIDTH - 40) / 3 + 10 + (10 + (WIDTH - 40) * 2 / 9) * 2, (WIDTH - 40) * 2 / 45, (WIDTH - 40) * 2 / 9, (WIDTH - 40) / 9);
        _button4.tag = 104;
        [_button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button4;
}

- (UIButton *)button5 {
    if (!_button5) {
        self.button5 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button5.frame = CGRectMake((WIDTH - 40) / 3 + 10, (WIDTH - 40) * 2 / 45 + (WIDTH - 40) / 9 + (WIDTH - 40) / 45, (WIDTH - 40) * 2 / 9, (WIDTH - 40) / 9);
        _button5.tag = 105;
        [_button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button5;
}

- (UIButton *)button6 {
    if (!_button6) {
        self.button6 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button6.frame = CGRectMake((WIDTH - 40) / 3 + 10 + (10 + (WIDTH - 40) * 2 / 9) * 1, (WIDTH - 40) * 2 / 45 + (WIDTH - 40) / 9 + (WIDTH - 40) / 45, (WIDTH - 40) * 2 / 9, (WIDTH - 40) / 9);
        _button6.tag = 106;
        [_button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button6;
}

- (UIButton *)button7 {
    if (!_button7) {
        self.button7 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button7.frame = CGRectMake((WIDTH - 40) / 3 + 10 + (10 + (WIDTH - 40) * 2 / 9) * 2, (WIDTH - 40) * 2 / 45 + (WIDTH - 40) / 9 + (WIDTH - 40) / 45, (WIDTH - 40) * 2 / 9, (WIDTH - 40) / 9);
        _button7.tag = 107;
        [_button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button7;
}


- (void)setModel:(Model *)model {
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    self.titleLabel.text = model.Cate;
    [self.photoImage sd_setImageWithURL:[NSURL URLWithString:model.ImgUrl] placeholderImage:[UIImage imageNamed:@"meishi5"]];
}

- (void)dealloc {
    self.button1 = nil;
    self.titleLabel = nil;
    self.photoImage = nil;
    self.jiantou = nil;
    self.button2 = nil;
    self.button3 = Nil;
    self.button4 = nil;
    self.button5 = nil;
    self.button6 = nil;
    self.button7 = nil;
    self.model = nil;
    [super dealloc];
}


@end
