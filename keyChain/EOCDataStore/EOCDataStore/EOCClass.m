//
//  EOCClass.m
//  EOCDataStore
//
//  Created by sy on 2018/4/25.
//  Copyright © 2018年 EOC. All rights reserved.
//

#import "EOCClass.h"

@implementation EOCClass

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.age forKey:@"age"];
    
}

//解
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    EOCClass *eocClass = [EOCClass new];
    eocClass.name = [aDecoder decodeObjectForKey:@"name"];
    eocClass.age = [aDecoder decodeObjectForKey:@"age"];
    return eocClass;
}


//// copy
- (id)copyWithZone:(nullable NSZone *)zone{
    
    EOCClass *eocClass = [EOCClass new];
    
    eocClass.name = self.name;
    eocClass.age = self.age;
    
    return eocClass;
    
}



@end
