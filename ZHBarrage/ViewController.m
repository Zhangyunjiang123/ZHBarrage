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
    
    _zh = [[ZHBarrage alloc]initWithFrame:CGRectMake(0, 50, [[UIScreen mainScreen] bounds].size.width, 300)];
    [self.view addSubview:_zh];
    
    [NSTimer scheduledTimerWithTimeInterval:3
                                     target:self
                                   selector:@selector(sendBarrage)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)sendBarrage
{
    NSString *msg = [NSString stringWithFormat:@" 随机数:%lu ",(arc4random() % 1000000000000)];
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:msg];
    [attributed setAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:17]} range:NSMakeRange(0, 5)];
    [attributed setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:17]} range:NSMakeRange(5, msg.length - 5)];
    NSMutableAttributedString *attributed_string = [[NSMutableAttributedString alloc] init];
    [attributed_string appendAttributedString:attributed];
    [_zh sendMessage:attributed_string withSpeed:100];
}
@end
