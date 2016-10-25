# 舜飞代码管家 SDK iOS 版 v0.9.0 使用文档

## 1、开发环境

* Xcode 7.0 或更高版本
* 支持 iOS 6.0.0 或更高版本

## 2、SDK 集成

2.1 将包含 SDK 最新版本的文件夹添加到项目中。

```
-📁 SuntengTagManager
 |-📃 SuntengTagManager.h
 |-📃 STMContainer.h
 |-📃 STMDataLayer.h
 |-📃 libSuntengTagManager.a
```

2.2 添加需要的 Framework：

```
CoreTelephony.framework
Foundation.framework
SystemConfiguration.framework
UIKit.framework
```

2.3 设置对应 **target** 的编译选项，在『Build Settings』->『Linking』->『Other Linker Flags』，添加 `-ObjC` 参数。

2.4 禁用 ATS。

在应用的 Info.plist 中添加禁用 ATS 代码。代码如下：

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## 3、SDK 使用

### 3.1 SDK 相关设置

**3.1.1 初始化 SDK**

```objc
#import "SuntengTagManager.h"

[[SuntengTagManager sharedInstance] registerWithContainerId:@"xxxxx"];
```

**3.1.2 设置日志级别**

```objc
#import "SuntengTagManager.h"

[[SuntengTagManager sharedInstance] setLogLevel:STMLogLevelVerbose];
```

**3.1.3 获取当前 SDK 版本**

```objc
#import "SuntengTagManager.h"

NSString *SDKVersion = [SuntengTagManager sharedInstance].version;
```

### 3.2 容器相关

#### 3.2.1 函数调用相关

**注册函数调用及回调**

```objc
#import "SuntengTagManager.h"

[[SuntengTagManager sharedInstance].container registerFunctionCallTagHandler:[[CustomTagHandler alloc] init]
                                                                          forTag:@"function_name"];
```

`CustomTagHandler.m` 中**实现函数调用回调**

```objc
- (void)executeTagFunctionName:(NSString *)tagFunctionName parameters:(NSDictionary *)parameters {
    if ([tagFunctionName isEqualToString:@"function_name"]) {
        NSLog(@"function_name called.");
    }
}
```

**获取已注册函数调用的回调，可用于检查函数是否已被注册**

```objc
#import "SuntengTagManager.h"

id<STMFunctionCallTagHandler> handler = [[SuntengTagManager sharedInstance].container functionCallTagHandlerForTag:@"function_name"];
```

#### 3.2.2 函数调用宏相关

**注册函数调用宏及回调**

```objc
#import "SuntengTagManager.h"
    [[SuntengTagManager sharedInstance].container registerFunctionCallMacroHandler:[[CustomMacroHandler alloc] init] forMacro:@"function_nameA"];
```

`CustomMacroHandler.m` 中**实现函数调用宏回调**

```objc
- (id)valueForMacroFunctionName:(NSString *)functionName parameters:(NSDictionary *)parameters {
    if ([functionName isEqualToString:@"function_nameA"]) {
        return @"macroValue";
    } else {
        return @"";
    }
}
```

**获取已注册函数调用宏的回调，可用于检查函数调用宏是否已被注册**

```objc
#import "SuntengTagManager.h"

id<STMFunctionCallMacroHandler> handler = [[SuntengTagManager sharedInstance].container functionCallMacroHandlerForMacro:@"function_nameA"];
```

#### 3.2.3 获取宏的值

```objc
#import "SuntengTagManager.h"

NSString *value = [[SuntengTagManager sharedInstance].container stringForKey:@"{{macro}}"];
```

### 3.3 数据层相关

#### 3.3.1 更新数据层

```objc
#import "SuntengTagManager.h"

[[SuntengTagManager sharedInstance].dataLayer updateDataLayer:@{@"keyForData": @"theSavedData"}];
```

#### 3.3.2 push 事件（触发检查代码是否符合规则）

```objc
#import "SuntengTagManager.h"

[[SuntengTagManager sharedInstance].dataLayer pushEvent:@"launchApp" data:nil];
```

#### 3.3.3 获取数据层中对应键的值

```objc
#import "SuntengTagManager.h"

id data = [[SuntengTagManager sharedInstance].dataLayer get:@"keyForData"];
```