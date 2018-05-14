//
//  ZHLabel.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHLabel.h"
#import "ZHAnimation.h"
#import "ZHbackgroundImage.h"

@implementation ZHLabel

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imagePath
{
    self = [super initWithFrame:frame];
    if (self) {
        self.unblocked = YES;
        self.textInsets = UIEdgeInsetsZero;
        self.text = [NSString stringWithFormat:@"默认创建时图"];
        [self sizeToFit];
        CGSize imageSize = self.frame.size;
        UIImage *bgimagePath = [UIImage imageNamed:imagePath];
        imageSize.height = bgimagePath.size.height;
        ZHbackgroundImage *ZHbgimage = [ZHbackgroundImage shareTool];
        UIImage *colorImage = [ZHbgimage updateBackgroundImageLabel:imageSize
                                                      withImageName:imagePath];
        self.layer.contents = (__bridge id) colorImage.CGImage;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

- (void)updateAttributed:(NSMutableAttributedString *)attributedString
               withSpeed:(int)speed
               withImage:(NSString *)imagePath
              withInsets:(UIEdgeInsets)insets
{
    self.unblocked = NO;
    if (imagePath == nil) {
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        paraStyle.alignment = NSTextAlignmentLeft;
        paraStyle.headIndent = 0.0f;
        paraStyle.firstLineHeadIndent = 10.0f;
        paraStyle.tailIndent = 0.0f;
        paraStyle.lineSpacing = 2.0f;
        [attributedString addAttributes:@{NSParagraphStyleAttributeName:paraStyle} range:NSMakeRange(0, attributedString.length)];
        self.attributedText = attributedString;
        self.textInsets = UIEdgeInsetsZero;
        [self sizeToFit];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor blackColor];
    } else {
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        paraStyle.alignment = NSTextAlignmentLeft;
        paraStyle.headIndent = 0.0f;
        CGFloat emptylen = self.font.pointSize * 1;
        paraStyle.firstLineHeadIndent = emptylen * 1.5;
        paraStyle.tailIndent = 0.0f;
        paraStyle.lineSpacing = 2.0f;
        [attributedString addAttributes:@{NSParagraphStyleAttributeName:paraStyle} range:NSMakeRange(0, attributedString.length)];
        self.attributedText = attributedString;
        self.textInsets = insets;
        [self sizeToFit];
        CGSize imageSize = self.frame.size;
        UIImage *bgimagePath = [UIImage imageNamed:imagePath];
        imageSize.height = bgimagePath.size.height;
        ZHbackgroundImage *ZHbgimage = [ZHbackgroundImage shareTool];
        UIImage *colorImage = [ZHbgimage updateBackgroundImageLabel:imageSize
                                                      withImageName:imagePath];
        self.layer.cornerRadius = 0;
        self.layer.masksToBounds = NO;
        self.layer.contents =  (__bridge id) colorImage.CGImage;
        self.backgroundColor = nil;
    }
    ZHAnimation *animation = [ZHAnimation shareTool];
    animation.speed = speed;
    [animation startAnimationandLabel:self];
}
@end
