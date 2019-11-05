//
//  KeyChainUpdateVCtr.m
//  EOCDataStore
//
//

#import "KeyChainUpdateVCtr.h"

@interface KeyChainUpdateVCtr ()

@end

@implementation KeyChainUpdateVCtr

- (void)viewDidLoad {
    [super viewDidLoad];
  
}


- (void)updateArch{
    NSMutableDictionary *conditionInfo = [NSMutableDictionary new];
    // 1 数据类型
    [conditionInfo setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    //2 设置条件 （查询）
    [conditionInfo setObject:@"EOCClassTest" forKey:(id)kSecAttrAccount];

    // 更新的数据
    NSMutableDictionary *newValueDict = [NSMutableDictionary new];
    NSString *newValue = @"987654";
    [newValueDict setObject:[newValue dataUsingEncoding:NSUTF8StringEncoding] forKey:(id)kSecValueData];
    
    OSStatus status = SecItemUpdate((CFDictionaryRef)conditionInfo, (CFDictionaryRef)newValueDict);
    if (status == noErr) {
        NSLog(@"success");
    }else{
        NSLog(@"fail: %d", status);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self updateArch];
}




@end
