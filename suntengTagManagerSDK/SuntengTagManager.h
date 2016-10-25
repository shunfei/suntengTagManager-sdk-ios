//
//  SuntengTagManager.h
//  SuntengTagManager
//
//  Created by Joe on 16/9/5.
//  Copyright © 2016年 Sunteng Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class STMContainer;
@class STMDataLayer;

typedef NS_ENUM(NSInteger, STMLogLevelType) {
    STMLogLevelVerbose = 0,
    STMLogLevelDebug,
    STMLogLevelInfo,
    STMLogLevelWarning,
    STMLogLevelError,
    STMLogLevelNone
};

@interface SuntengTagManager : NSObject

@property (nonatomic, strong, readonly) STMContainer *container;
@property (nonatomic, strong, readonly) STMDataLayer *dataLayer;

+ (instancetype)sharedInstance;

- (void)registerWithContainerId:(NSString *)containerId;

- (STMLogLevelType)logLevel;
- (void)setLogLevel:(STMLogLevelType)logLevel;

- (NSString *)version;

// unavailable
- (instancetype)init __attribute__((unavailable("can not use `- init` method, please use `+ sharedInstance` method")));
+ (instancetype)new __attribute__((unavailable("can not use `+ new` method, please use `+ sharedInstance` method")));

@end

NS_ASSUME_NONNULL_END
