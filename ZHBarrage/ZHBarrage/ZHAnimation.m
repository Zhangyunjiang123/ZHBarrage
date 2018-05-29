//
//  ZHAnimation.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#define ZH_ANIMATION_WIDTH [[UIScreen mainScreen] bounds].size.width

#import "ZHAnimation.h"

static ZHAnimation *animation;

@implementation ZHAnimation

+ (instancetype)shareTool
{
    @synchronized (animation) {
        animation = [[ZHAnimation alloc] init];
    }
    return animation;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)startAnimationandLabel:(ZHLabel *)label
{
    CGFloat customLabwith = label.frame.size.width;
    int time = (ZH_ANIMATION_WIDTH + customLabwith*2 + 10)/self.spseed;
    CGFloat left_P = - (customLabwith/2 - 10);
    CGPoint center = CGPointMake(ZH_ANIMATION_WIDTH + customLabwith/2 + 5, label.center.y);
    CGPoint finishPoint = CGPointMake(left_P, label.center.y);
    CABasicAnimation *animationgo = [CABasicAnimation animationWithKeyPath:@"position"];
    animationgo.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationgo.duration = time;
    animationgo.repeatCount = 1;
    animationgo.delegate = self;
    animationgo.removedOnCompletion = NO;
    animationgo.beginTime = CACurrentMediaTime();
    animationgo.fromValue = [NSValue valueWithCGPoint:center];
    animationgo.toValue = [NSValue valueWithCGPoint:finishPoint];
    [label.layer addAnimation:animationgo forKey:@"label"];
    _label = label;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [_label.layer animationForKey:@"label"]) {
        [_label.layer removeAnimationForKey:@"label"];
        _label.unblocked = YES;
    }
}
@end
