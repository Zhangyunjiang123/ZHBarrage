//
//  ZHBarrage.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHBarrage.h"
#import "ZHLabel.h"
#import "ZHModel.h"

#define ZH_WIDTH self.frame.size.width
#define ZH_HEIGHT self.frame.size.height
#define ZH_Label_HEIGHT 30
#define ZH_Label_tag    10000

@interface ZHBarrage()
{
    UILabel   *label;
    int       _countChannel;
}
@end

@implementation ZHBarrage

- (instancetype)initWithFrame:(CGRect)frame withdefaultImage:(NSString *)imagePath
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatChannel:imagePath];
    }
    return self;
}

/**
 创建通道
 */
- (void)creatChannel:(NSString *)imagePath
{
    _countChannel = (int)(ZH_HEIGHT / (ZH_Label_HEIGHT + 5));
    _countChannel = _countChannel > 15 ? 15 :_countChannel;
    for (int i = 0; i < _countChannel; i++) {
        ZHLabel *label = [[ZHLabel alloc] initWithFrame:CGRectMake(ZH_WIDTH, i*(ZH_Label_HEIGHT + 5), 0, ZH_Label_HEIGHT) withImage:imagePath];
        label.tag = ZH_Label_tag + i;
        [self addSubview:label];
    }
    //处理创建完成后两秒才显示弹幕
    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(onAccording)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)onAccording
{
    _isaccording = YES;
    if (_cacheInfoArr.count == 0) {
        return;
    }
    if (!_cacheTime) {
        _cacheTime = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                      target:self
                                                    selector:@selector(cacheTimeFunction)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)sendMessage:(NSMutableAttributedString *)attributedString
          withSpeed:(int)speed
          withImage:(NSString *)imagePath
         withInsets:(UIEdgeInsets)insets
{
    if (!_isaccording) {
        if (!_cacheInfoArr) {
            _cacheInfoArr = [[NSMutableArray alloc] init];
        }
        ZHModel *model = [[ZHModel alloc] init];
        model.attributedString = attributedString;
        model.imagePath = imagePath;
        model.speed = speed;
        model.textInsets = insets;
        [_cacheInfoArr addObject:model];
        return;
    }
    if (_cacheInfoArr && _cacheInfoArr.count > 0) {
        //别急，先处理当前缓存信息
        ZHModel *model = [[ZHModel alloc]init];
        model.attributedString = attributedString;
        model.speed = speed;
        model.imagePath = imagePath;
        model.textInsets = insets;
        [_cacheInfoArr addObject:model];
        return;
    }
    //是否查找到通道
    for (int i = 0; i < _countChannel; i++) {
        ZHLabel *label = [self viewWithTag:ZH_Label_tag + i];
        NSLog(@"curr channel %d unblocked = %d",i,label.unblocked);
        if (label.unblocked == YES) {
            [label updateAttributed:attributedString
                          withSpeed:speed
                          withImage:imagePath
                         withInsets:insets];
            return;
        }
    }
    //处理未找到通道时动作
    NSLog(@"creat succeed");
    if (!_cacheInfoArr) {
        _cacheInfoArr = [[NSMutableArray alloc] init];
    }
    ZHModel *model = [[ZHModel alloc] init];
    model.attributedString = attributedString;
    model.imagePath = imagePath;
    model.speed = speed;
    model.textInsets = insets;
    [_cacheInfoArr addObject:model];
    if (!_cacheTime) {
        _cacheTime = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                      target:self
                                                    selector:@selector(cacheTimeFunction)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

- (void)cacheTimeFunction
{
    ZHModel *model = [_cacheInfoArr firstObject];
    for (int i = 0; i < _countChannel; i++) {
        ZHLabel *label = [self viewWithTag:ZH_Label_tag + i];
        if (label.unblocked == YES) {
            [label updateAttributed:model.attributedString
                          withSpeed:model.speed
                          withImage:model.imagePath
                         withInsets:model.textInsets];
            [_cacheInfoArr removeObjectAtIndex:0];
            if (_cacheInfoArr.count == 0) {
                //清空集合，停止时间循环
                _cacheInfoArr = nil;
                [self stopCacheTime];
                NSLog(@"clean succeed");
            }
            return;
        }
    }
}

- (void)dealloc
{
    [self stopCacheTime];
}

- (void)stopCacheTime
{
    if (_cacheTime) {
        [_cacheTime invalidate];
        _cacheTime = nil;
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
