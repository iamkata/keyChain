//
//  EOCClass.h
//  EOCDataStore
//
//  Created by sy on 2018/4/25.
//  Copyright © 2018年 EOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOCClass : NSObject<NSCoding, NSCopying>


@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *age;


@end
