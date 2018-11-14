//
//  ViewController.m
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/23.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ViewController.h"
#import "ZHBarrage.h"

@interface ViewController () <UITextViewDelegate>
{
    ZHBarrage               *_zh;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _zh = [[ZHBarrage alloc]initWithFrame:CGRectMake(0, 50, [[UIScreen mainScreen] bounds].size.width, 15*35) withdefaultImage:@"barrage_bg_normal"];
    [self.view addSubview:_zh];
    [self sendBarrage];
    [NSTimer scheduledTimerWithTimeInterval:10
                                     target:self
                                   selector:@selector(sendBarrage)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)sendBarrage
{
    NSString *msg = [NSString stringWithFormat:@"测试随机数:%ld    ",(arc4random() % 1000000000000)];
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:msg];
    [attributed setAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:17]} range:NSMakeRange(0, 5)];
    [attributed setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:17]} range:NSMakeRange(5, msg.length - 5)];
    NSMutableAttributedString *attributed_string = [[NSMutableAttributedString alloc] init];
    [attributed_string appendAttributedString:attributed];
    
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"10" withInsets:UIEdgeInsetsMake(-10.f, -10.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"11" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:nil withInsets:UIEdgeInsetsMake(0.f, -15.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"1" withInsets:UIEdgeInsetsMake(0.f, 6.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"2" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"3" withInsets:UIEdgeInsetsMake(0.f, -10.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"4" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"5" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"6" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"7" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"8" withInsets:UIEdgeInsetsMake(0.f, -10.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"9" withInsets:UIEdgeInsetsMake(0.f, 2.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"4" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"5" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"6" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"7" withInsets:UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"8" withInsets:UIEdgeInsetsMake(0.f, -10.f, 0.f, 0.f)];
    [_zh sendMessage:attributed_string withSpseed:100 withImage:@"9" withInsets:UIEdgeInsetsMake(0.f, 2.f, 0.f, 0.f)];

}
@end
