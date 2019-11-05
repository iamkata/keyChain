//
//  KeyChainAddVCtr.m
//  EOCDataStore

//

#import "KeyChainAddVCtr.h"
#import <Security/Security.h>

@interface KeyChainAddVCtr ()

@end

// 存在系统下的

@implementation KeyChainAddVCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)saveDataToKeyChain{
    
    NSMutableDictionary *infoDict = [NSMutableDictionary new];
    // 1 存的什么数据类型
    /*
     kSecClassInternetPassword // 互联网密码
     kSecClassGenericPassword // 通用密码
     kSecClassCertificate// 证书
     kSecClassKey  // 密钥
     kSecClassIdentity // 身份ID
    */
    [infoDict setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    
    // 2 存的什么数据value
    NSString *password = @"abc123";
    [infoDict setObject:[password dataUsingEncoding:NSUTF8StringEncoding] forKey:(id)kSecValueData];
    
    // 3 设置查询的条件 
    [infoDict setObject:@"EOCClassTest" forKey:(id)kSecAttrAccount];
    
    //往系统下面添加一个字典
    OSStatus status = SecItemAdd((CFDictionaryRef)infoDict, NULL);
    if (status == noErr) {
        NSLog(@"success");
    }else{
        NSLog(@"fail: %d", status);
    }
}


- (void)saveDataMultiApp{
    NSMutableDictionary *infoDict = [NSMutableDictionary new];
    // 1 数据类型
    /*
     kSecClassInternetPassword // 互联网密码
     kSecClassGenericPassword // 通用密码
     kSecClassCertificate// 证书
     kSecClassKey  // 密钥
     kSecClassIdentity // 身份ID
     */
    [infoDict setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    
    // 2 数据value
    NSString *password = @"eocApp123";
    [infoDict setObject:[password dataUsingEncoding:NSUTF8StringEncoding] forKey:(id)kSecValueData];
    
    /*
      跨应用数据
      kSecAttrAccessGroup 组的条件key
      1 配置groupkey （机构号 + bundle identifier）
      2 配置一个plist文件（把groupkey放进去, 如下图）
      3 配置工程的 coding entitlment
     */
    //机构号就是发布证书里面的用户ID或者组织单位
    [infoDict setObject:@"Y9PY69PRSB.com.test.EocClass" forKey:(id)kSecAttrAccessGroup];
    
    // 3 设置条件 （查询）
    [infoDict setObject:@"EOCClassMutiAppTwo" forKey:(id)kSecAttrAccount];
    
    OSStatus status = SecItemAdd((CFDictionaryRef)infoDict, NULL);
    if (status == noErr) {
        NSLog(@"success");
    }else{
        NSLog(@"fail: %d", status);
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self saveDataMultiApp];
    
}





@end
