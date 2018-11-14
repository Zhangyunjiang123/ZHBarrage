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
 设置字偏移量
 */
@property(nonatomic,assign)UIEdgeInsets textInsets;
/**
 赋值

 @param attributedString 值
 @param spseed 速度
 */
- (void)updateAttributed:(NSMutableAttributedString *)attributedString
              withSpseed:(int)spseed
               withImage:(NSString *)imagePath
              withInsets:(UIEdgeInsets)insets;

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imagePath;


/**
 重新初始化
 */
- (void)reinitialize;

@end
