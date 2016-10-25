//
//  STMDataLayer.h
//  SuntengTagManager
//
//  Created by Joe on 16/9/7.
//  Copyright © 2016年 Sunteng Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STMDataLayer : NSObject

- (void)updateDataLayer:(NSDictionary *)update;

- (void)pushEvent:(NSString *)event data:(nullable NSDictionary *)data;

- (nullable NSObject *)get:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
