//
//  CustomTagHandler.m
//  TagManagerSample
//
//  Created by Joe on 16/9/26.
//  Copyright © 2016年 Sunteng Information Technology Co., Ltd. All rights reserved.
//

#import "CustomTagHandler.h"
#import <UIKit/UIKit.h>

@implementation CustomTagHandler

- (void)executeTagFunctionName:(NSString *)tagFunctionName parameters:(NSDictionary *)parameters {
    NSLog(@"%s is called! function name:%@, parameters:%@\n Just do what you want to do with the tagFunctionName and parameters!", __FUNCTION__, tagFunctionName, parameters);
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"自定义函数%@已被调用", tagFunctionName]
                                    message:[NSString stringWithFormat:@"函数参数:%@\n", parameters]
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    });

}

@end