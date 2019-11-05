//
//  KeyChainSearchVCtr.m
//  EOCDataStore
//
//
//

#import "KeyChainSearchVCtr.h"

@interface KeyChainSearchVCtr ()

@end

@implementation KeyChainSearchVCtr

- (void)viewDidLoad {
    [super viewDidLoad];

}


//通过系统提供的接口，操作数据库
- (void)getArchData{
    
    //条件字典
    NSMutableDictionary *conditionInfo = [NSMutableDictionary new];
    // 1 数据类型
    [conditionInfo setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    //2 设置条件 （查询）
    [conditionInfo setObject:@"EOCClassTest" forKey:(id)kSecAttrAccount];
    // 3 返回的数据格式
    [conditionInfo setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData]; // kSecReturnRef
    
    // 再存一条记录 change ， 读这个change的时候，发现change 是ture， update为false
    
    CFDataRef data = NULL; //返回的值
    OSStatus status = SecItemCopyMatching((CFDictionaryRef)conditionInfo, (CFTypeRef*)&data);
    if (status == noErr) {
        NSLog(@"success");
    }else{
        NSLog(@"fail: %d", status);
    }
    
    NSData *backData = (__bridge NSData*)data;
    NSLog(@"Get:::%s", [backData bytes]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self getArchData];
    
}



@end
