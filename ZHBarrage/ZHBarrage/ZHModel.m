//
//  ZHModel.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/24.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHModel.h"

@implementation ZHModel

@synthesize attributedString;
@synthesize speed;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.attributedString = [[NSMutableAttributedString alloc] initWithString:@""];
        self.speed = 1;
    }
    return self;
}
@end
