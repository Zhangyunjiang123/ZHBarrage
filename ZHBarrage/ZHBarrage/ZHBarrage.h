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
    NSMutableArray   *_cacheInfoArr; //缓存集合
    NSTimer          *_cacheTime;    //缓存倒计时
}

/**
 发送消息

 @param attributedString 内容
 @param speed 速度
 */
- (void)sendMessage:(NSMutableAttributedString *)attributedString withSpeed:(int)speed;

@end
