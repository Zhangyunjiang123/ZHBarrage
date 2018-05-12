//
//  ZHbackgroundImage.h
//  ZHBarrage
//
//  Created by 张云江 on 2018/5/12.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHbackgroundImage : NSObject

+ (instancetype)shareTool;

- (UIImage *)updateBackgroundImageLabel:(CGSize)labelSize
                          withImageName:(NSString *)imageName;

@end
