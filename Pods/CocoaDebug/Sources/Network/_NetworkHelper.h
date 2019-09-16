//
//  Example
//  man
//
//  Created by man on 11/11/2018.
//  Copyright © 2018 man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "_HttpDatasource.h"

@interface _NetworkHelper : NSObject

//color for objc
@property (nonatomic, strong) UIColor *mainColor;

/**
 *  设置只抓取的域名,忽略大小写,默认抓取所有
 */
@property (nonatomic, copy) NSArray<NSString *> *onlyURLs;
/**
 *  设置不抓取的域名,忽略大小写,默认抓取所有
 */
@property (nonatomic, copy) NSArray<NSString *> *ignoredURLs;
/**
 *  日志最大数量,默认`1000`
 */
@property (nonatomic, assign) NSInteger logMaxCount;

@property (nonatomic, assign) BOOL isEnable;

/**
 *  启用
 */
- (void)enable;
/**
 *  禁用
 */
- (void)disable;

+ (instancetype)shared;

@end
