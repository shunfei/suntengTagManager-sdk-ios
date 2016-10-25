//
//  ViewController.m
//  suntengTagManagerGitHubSample
//
//  Created by samingzhong on 16/10/24.
//  Copyright © 2016年 Sunteng Information Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "SuntengTagManager.h"
#import "STMContainer.h"
#import "AppDelegate.h"
#import "STMDataLayer.h"

@interface ViewController ()

@property (nonatomic, strong) STMContainer *container;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sdkVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *appIDLabel;

@property (weak, nonatomic) IBOutlet UILabel *macroLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.container = [SuntengTagManager sharedInstance].container;
    
    self.appNameLabel.text = [self.container stringForKey:@"{{App Name}}"];
    self.sdkVersionLabel.text = [self.container stringForKey:@"{{SDK Version}}"];
    self.deviceNameLabel.text = [self.container stringForKey:@"{{Device Name}}"];
    self.appIDLabel.text = [self.container stringForKey:@"{{App ID}}"];
    
}

#pragma mark - IBAction

- (IBAction)getCustomFunctionMacroValue:(id)sender {
    self.macroLabel.text = [self.container stringForKey:@"{{CustomFunctionMacro}}"];
}

- (IBAction)getCustomFunctionMacroValueTips:(id)sender {
    NSString *content = @"温馨提示:\n在获取宏值之前,请确定该自定义函数类型宏所对应的自定义函数已使用 - [STMContainer registerFunctionCallMacroHandler:forMacro:] 注册.如本例中的自定义函数宏对应的函数名为customFunctionNameA";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:content
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)fireCustomFunctionTag:(id)sender {
    [[SuntengTagManager sharedInstance].dataLayer pushEvent:self.eventLabel.text data:nil];
}

- (IBAction)getCustomFunctionTagTips:(id)sender {
    NSString *content = @"温馨提示:\n1.在触发自定义函数tag之前,请确定该自定义函数tag所对应的自定义函数已使用 - [STMContainer registerFunctionCallTagHandler:forTag:] 注册.如本例中的自定义函数tag对应的函数名为customFunctionNameB.\n2.该tag触发规则为:事件名称为 myCustomEvent.";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:content
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)refreshContainer:(id)sender {
    [self.container refresh];
}

@end
