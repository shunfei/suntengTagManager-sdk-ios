//
//  STMContainer.h
//  SuntengTagManager
//
//  Created by Joe on 16/9/7.
//  Copyright © 2016年 Sunteng Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class STMContainer;

@protocol STMFunctionCallTagHandler <NSObject>

@optional

- (void)executeTagFunctionName:(NSString *)tagFunctionName parameters:(NSDictionary *)parameters;

@end

@protocol STMFunctionCallMacroHandler <NSObject>

@optional

- (id)valueForMacroFunctionName:(NSString *)functionName parameters:(NSDictionary *)parameters;

@end

@interface STMContainer : NSObject

@property (nonatomic, strong, readonly) NSNumber *containerId;

- (NSString *)stringForKey:(NSString *)key;

- (void)refresh;

- (void)registerFunctionCallMacroHandler:(nullable id<STMFunctionCallMacroHandler>)handler
                                forMacro:(NSString *)macroName;
- (nullable id<STMFunctionCallMacroHandler>)functionCallMacroHandlerForMacro:(NSString *)functionCallMacroName;

- (void)registerFunctionCallTagHandler:(nullable id<STMFunctionCallTagHandler>)handler
                                forTag:(NSString *)tagName;
- (nullable id<STMFunctionCallTagHandler>)functionCallTagHandlerForTag:(NSString *)functionCallTagName;

@end

NS_ASSUME_NONNULL_END
