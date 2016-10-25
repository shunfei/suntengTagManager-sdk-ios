//
//  CustomMacroHandler.m
//  TagManagerSample
//
//  Created by Joe on 16/9/26.
//  Copyright © 2016年 Sunteng Information Technology Co., Ltd. All rights reserved.
//

#import "CustomMacroHandler.h"
#import <UIKit/UIKit.h>

@implementation CustomMacroHandler

- (id)valueForMacroFunctionName:(NSString *)functionName parameters:(NSDictionary *)parameters {
    NSLog(@"%s is called! function name:%@, parameters:%@\n You need to return a value with the tagFunctionName and parameters!", __FUNCTION__, functionName, parameters);
    NSString *result;
    
    
    if ([functionName isEqualToString:@"customFunctionNameA"]) {
        result = [NSString stringWithFormat:@"%@_%@", parameters[@"keyA"], parameters[@"keyB"]];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"来自宏的%@函数已被调用", functionName]
                                                            message:[NSString stringWithFormat:@"函数参数:%@\n 返回值:%@", parameters, result]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    });
    
    return result;
}

@end
