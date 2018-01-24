//
//  ZHBarrage.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHBarrage.h"
#import "ZHLabel.h"

#define ZH_WIDTH self.frame.size.width
#define ZH_HEIGHT self.frame.size.height
#define ZH_Label_HEIGHT 20
#define ZH_Label_tag    10000
@interface ZHBarrage()
{
    UILabel   *label;
    int       _countChannel;
}
@end

@implementation ZHBarrage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatChannel];
    }
    return self;
}

/**
 创建通道
 */
- (void)creatChannel
{
    _countChannel = (int)(ZH_HEIGHT / (ZH_Label_HEIGHT + 5));
    _countChannel = _countChannel > 15 ? 15 :_countChannel;
    for (int i = 0; i < _countChannel; i++) {
        ZHLabel *label = [[ZHLabel alloc] initWithFrame:CGRectMake(ZH_WIDTH, i*(ZH_Label_HEIGHT + 5), 0, ZH_Label_HEIGHT)];
        label.tag = ZH_Label_tag + i;
        [self addSubview:label];
    }
}

- (void)sendMessage:(NSMutableAttributedString *)attributedString withSpeed:(int)speed
{
    for (int i = 0; i < _countChannel; i++) {
        ZHLabel *label = [self viewWithTag:ZH_Label_tag + i];
        NSLog(@"curr channel %d unblocked = %d",i,label.unblocked);
        if (label.unblocked == YES) {
            [label updateAttributed:attributedString withSpeed:speed];
            return;
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self)
    {
        return nil;
    } else {
        return hitView;
    }
}
@end
