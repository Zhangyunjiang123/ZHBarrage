//
//  ZHModel.h
//  ZHBarrage
//
//  Created by 张云江 on 2018/1/24.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZHModel : NSObject

@property(nonatomic,strong)NSMutableAttributedString *attributedString;
@property(nonatomic,assign)UIEdgeInsets textInsets;
@property(nonatomic,copy)NSString  *imagePath;
@property(nonatomic,assign)int     speed;

@end
