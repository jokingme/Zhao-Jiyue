//
//  DetailStepTableViewCell.m
//  Kuitan
//
//  Created by lanouhn on 15/10/20.
//  Copyright (c) 2015年 S&G. All rights reserved.
//
#import "DetailStepTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MeiShi.h"

@implementation DetailStepTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.stepPhoto];
        [self.contentView addSubview:self.stepIntro];
    }
    return self;
}

- (UIImageView *)stepPhoto {
    if (!_stepPhoto) {
        self.stepPhoto = [[[UIImageView alloc] initWithFrame:CGRectMake(WIDTH / 40, WIDTH / 40, WIDTH / 4, WIDTH / 6)] autorelease];
    }
    return [[_stepPhoto retain] autorelease];
}

- (UILabel *)stepIntro {
    if (!_stepIntro) {
        self.stepIntro = [[[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 40 + WIDTH / 4 + WIDTH / 40, WIDTH / 40, WIDTH - WIDTH / 40 - WIDTH / 40 - WIDTH / 4 - WIDTH / 40,50)] autorelease];
        _stepIntro.numberOfLines = 0;
        _stepIntro.font = [UIFont systemFontOfSize:16];
    }
    return [[_stepIntro retain] autorelease];
}

- (void)setModel:(stepsModel *)model {
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    CGRect frame = CGRectMake(WIDTH / 40 + WIDTH / 4 + WIDTH / 40, WIDTH / 40, WIDTH - WIDTH / 40 - WIDTH / 40 - WIDTH / 4 - WIDTH / 40,[[self class] heightForContent:model.Intro]);
    self.stepIntro.frame = frame;
    [self.stepPhoto sd_setImageWithURL:[NSURL URLWithString:model.StepPhoto] placeholderImage:[UIImage imageNamed:@"meishi5"]];
    self.stepIntro.text =[NSString stringWithFormat:@"%@",model.Intro];
}

+ (CGFloat)heightForRow:(stepsModel *)model {
    CGFloat height1 = [[self class] heightForContent:model.Intro];
    CGFloat height2 = WIDTH / 6;
    if (height2 >= height1) {
        return height2 + WIDTH / 20;
    }
    return height1 + WIDTH / 20;
}

+ (CGFloat)heightForContent:(NSString *)text {
    return [text boundingRectWithSize:CGSizeMake(WIDTH - WIDTH / 40 - WIDTH / 40 - WIDTH / 4 - WIDTH / 40, 1000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
}

- (void)dealloc {
    self.stepIntro = nil;
    self.stepPhoto = nil;
    self.model = nil;
    [super dealloc];
}


@end
