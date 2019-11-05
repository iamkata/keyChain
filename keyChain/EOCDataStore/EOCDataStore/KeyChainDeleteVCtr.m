//
//  KeyChainDeleteVCtr.m
//  EOCDataStore
//
//

#import "KeyChainDeleteVCtr.h"

@interface KeyChainDeleteVCtr ()

@end

@implementation KeyChainDeleteVCtr

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)deleteArchData{
    
    NSMutableDictionary *conditionInfo = [NSMutableDictionary new];
    // 1 数据类型
    [conditionInfo setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    //2 设置条件 （查询）
    [conditionInfo setObject:@"EOCClassTest" forKey:(id)kSecAttrAccount];
    
    OSStatus status = SecItemDelete((CFDictionaryRef)conditionInfo);
    if (status == noErr) {
        NSLog(@"success");
    }else{
        NSLog(@"fail: %d", status);
    } 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self deleteArchData];
}




@end
