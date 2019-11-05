//
//  ViewController.m
//  TwoProject
//
//  Created by sy on 2018/4/25.
//  Copyright © 2018年 sy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self getArchData];
}


- (void)getArchData{
    NSMutableDictionary *conditionInfo = [NSMutableDictionary new];
    // 1 数据类型
    [conditionInfo setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    //2 设置条件 （查询）
    [conditionInfo setObject:@"EOCClassMutiAppTwo" forKey:(id)kSecAttrAccount];
   // [conditionInfo setObject:@"Y9PY69PRSB.com.test.EocClass" forKey:(id)kSecAttrAccessGroup];
    // 3 返回的数据格式
    [conditionInfo setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    
    CFDataRef data = NULL;
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)conditionInfo, (CFTypeRef*)&data);
    if (status == noErr) {
        NSLog(@"success");
    }else{
        NSLog(@"fail: %d", status);
    }
    
    NSData *backData = (__bridge NSData*)data;
    NSLog(@"Get:::%s", [backData bytes]);
}

@end
