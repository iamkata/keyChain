//
//  EOCLocalAnalyseVCtr.m
//  EOCDataStore
//
//  Created by EOC on  /5/22.
//  Copyright ©     EOC. All rights reserved.
//
// http://svr.tuliu.com/center/front/app/util/updateVersions?versions_id=1&system_type=1
#import "EOCLocalAnalyseVCtr.h"
#import <sys/xattr.h>

@interface EOCLocalAnalyseVCtr ()

@end

@implementation EOCLocalAnalyseVCtr



- (void)viewDidLoad {
    
    [super viewDidLoad];

}


- (IBAction)userDefaultSave:(id)sender{
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"eocClass"];
    
}

- (IBAction)netCache:(id)sender{
    
    [self netLoadTask];
    
}

//网络缓存
- (void)netLoadTask{
    NSString *urlStr = [NSString stringWithFormat:@"http://svr.tuliu.com/center/front/app/util/updateVersions?versions_id=1&system_type=1"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    //[NSURLSessionConfiguration defaultSessionConfiguration]; // 默认的缓存存在disk
    //NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]]; // 缓存存在内存
    NSURLSessionTask *task =  [session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *infoDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", infoDict);
    }];
    [task resume];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[NSUserDefaults standardUserDefaults] setObject:@"3" forKey:@"tow"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}




@end


