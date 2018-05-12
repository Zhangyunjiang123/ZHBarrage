//
//  ZHbackgroundImage.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/5/12.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHbackgroundImage.h"

@implementation ZHbackgroundImage

static ZHbackgroundImage *background;

+ (instancetype)shareTool
{
    @synchronized (background) {
        if (!background) {
            background = [[ZHbackgroundImage alloc] init];
        }
    }
    return background;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIImage *)updateBackgroundImageLabel:(CGSize)labelSize
                          withImageName:(NSString *)imageName;
{
    UIImage *bgimage = [UIImage imageNamed:imageName];
    UIEdgeInsets insets = UIEdgeInsetsMake(0, bgimage.size.width/2 + 5, 0, bgimage.size.width/2 - 6);
    bgimage = [bgimage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    UIImage *newbgimage = [self reSizeImage:bgimage toSize:labelSize];
    return newbgimage;
}

- (UIImage *)reSizeImage:(UIImage *)image
                  toSize:(CGSize)reSize
{
    CGFloat scale = [[UIScreen mainScreen]scale];
    UIGraphicsBeginImageContextWithOptions(reSize, NO, scale);
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
