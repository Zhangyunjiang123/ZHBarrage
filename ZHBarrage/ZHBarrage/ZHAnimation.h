//
//  ZHAnimation.h
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHLabel.h"

@interface ZHAnimation : NSObject <CAAnimationDelegate>
{
    ZHLabel        *_label;
}
@property(nonatomic,assign)int  spseed;

+ (instancetype)shareTool;
- (void)startAnimationandLabel:(ZHLabel *)label;

@end
