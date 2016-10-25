//
//  AppDelegate.m
//  suntengTagManagerGitHubSample
//
//  Created by samingzhong on 16/10/24.
//  Copyright © 2016年 Sunteng Information Technology Co., Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "SuntengTagManager.h"
#import "STMContainer.h"
#import "CustomMacroHandler.h"
#import "CustomTagHandler.h"

@interface AppDelegate ()

@property (nonatomic, strong) STMContainer *container;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[SuntengTagManager sharedInstance] setLogLevel:STMLogLevelVerbose];
    
    // register tagmanager with your containerID
    [[SuntengTagManager sharedInstance]registerWithContainerId:@"10493"];
    self.container = [SuntengTagManager sharedInstance].container;
    
    //register a customFunctionCall Macro handler with a functionName.
    [self.container registerFunctionCallMacroHandler:[CustomMacroHandler new ] forMacro:@"customFunctionNameA"];
    
    // regiester a customFunctionCall Tag handler with a functionName.
    [self.container registerFunctionCallTagHandler:[CustomTagHandler new] forTag:@"customFunctionNameB"];
    
    // predefine Macro
    NSLog(@"App Name:%@\n SDK Version:%@\n App ID:%@\n Device Name:%@",
          [self.container stringForKey:@"{{App Name}}"],
          [self.container stringForKey:@"{{SDK Version}}"],
          [self.container stringForKey:@"{{App ID}}"],
          [self.container stringForKey:@"{{Device Name}}"]);
    
    return YES;
}

@end
