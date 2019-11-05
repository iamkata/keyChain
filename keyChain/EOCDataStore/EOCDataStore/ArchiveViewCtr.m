//
//  ArchiveViewCtr.m
//  EOCDataStore
//
//  Created by EOC on  /5/18.
//  Copyright ©     EOC. All rights reserved.
//

#import "ArchiveViewCtr.h"
#import "EOCClass.h"

@interface ArchiveViewCtr (){

}

@end

@implementation ArchiveViewCtr

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self saveObject];
}


- (void)saveObject{
    
    EOCClass *eocClass = [EOCClass new];
    eocClass.name  = @"eocClass";
    eocClass.age = @"11";
    
    
    NSData *eocData = [NSKeyedArchiver archivedDataWithRootObject:eocClass];
    NSLog(@"data数据::%s", [eocData bytes]);
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    filePath = [filePath stringByAppendingPathComponent:@"eocClass"];
    [eocData writeToFile:filePath atomically:YES];
    
}


- (void)getObject{
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    filePath = [filePath stringByAppendingPathComponent:@"eocClass"];
    
    EOCClass *eocClass = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"%@, %@", eocClass.name, eocClass.age);
    
    EOCClass *eocClassTwo = [eocClass copy];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self getObject];
}



@end
