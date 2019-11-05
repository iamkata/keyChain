//
//  BundleViewCtr.m
//  EOCDataStore
//
//  Created by sy on  /11/20.
//  Copyright ©     EOC. All rights reserved.
//

#import "BundleViewCtr.h"

@interface BundleViewCtr ()

@end

@implementation BundleViewCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BundleViewCtr";
    
    // HUD
    
 //   _imageView.image = [UIImage imageNamed:@"EOCBundle.bundle/11.png"];
    
    // 用代码取路径
    
    NSString *boudlePath = [[NSBundle mainBundle] pathForResource:@"EOCBundle" ofType:@"bundle"];
    
    NSBundle *eocBoundle = [NSBundle bundleWithPath:boudlePath];
    
    NSString *imagePath = [eocBoundle pathForResource:@"11" ofType:@"png"];
    
    _imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    
    
}




@end
