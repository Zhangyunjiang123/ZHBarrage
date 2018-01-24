//
//  ZHLabel.h
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHLabel : UILabel

/**
 通道是否畅通 YES 通畅
 */
@property(nonatomic,assign)BOOL unblocked;


/**
 赋值

 @param attributedString 值
 @param speed 速度
 */
- (void)updateAttributed:(NSMutableAttributedString *)attributedString withSpeed:(int)speed;

@end
