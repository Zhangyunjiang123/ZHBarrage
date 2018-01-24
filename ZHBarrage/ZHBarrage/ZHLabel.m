//
//  ZHLabel.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHLabel.h"
#import "ZHAnimation.h"

@implementation ZHLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        self.textAlignment = NSTextAlignmentLeft;
        self.backgroundColor = [UIColor blackColor];
        self.unblocked = YES;   //默认畅通
        self.font = [UIFont systemFontOfSize:17];
    }
    return self;
}

- (void)updateAttributed:(NSMutableAttributedString *)attributedString withSpeed:(int)speed
{
    self.unblocked = NO;
    self.attributedText = attributedString;
    
    [self sizeToFit];
    
    ZHAnimation *animation = [ZHAnimation shareTool];
    animation.speed = speed;
    [animation startAnimationandLabel:self];
}
@end
