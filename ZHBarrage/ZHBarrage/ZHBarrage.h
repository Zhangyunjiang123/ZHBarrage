//
//  ZHBarrage.h
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHBarrage : UIView
{
    NSTimer          *caCcheTime;    //缓存倒计时
    
    NSMutableArray   *_cacheInfoArr; //缓存集合
    BOOL             _isaccording;   //延迟显示弹幕数据 YES 显示
}

/**
 发送消息

 @param attributedString 内容
 @param spseed 速度
 @param imagePath 背景图片地址
 @param insets 偏移量
 */
- (void)sendMessage:(NSMutableAttributedString *)attributedString
         withSpseed:(int)spseed
          withImage:(NSString *)imagePath
         withInsets:(UIEdgeInsets)insets;

- (instancetype)initWithFrame:(CGRect)frame withdefaultImage:(NSString *)imagePath;

@end
