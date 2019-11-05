//
//  ViewController.m
//  EOCDataStore
//
//  Created by EOC on  /5/18.
//  Copyright ©     EOC. All rights reserved.
//

#import "ViewController.h"
#import "EOCLocalAnalyseVCtr.h"
#import "KeyChainAddVCtr.h"
#import "KeyChainDeleteVCtr.h"
#import "KeyChainUpdateVCtr.h"
#import "KeyChainSearchVCtr.h"
#import "ArchiveViewCtr.h"
#import "BundleViewCtr.h"
#import <sys/xattr.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"数据";
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", filePath);
    
    
    [self addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:filePath]];
}


// 设置非备份
// 这样documents文件夹下的东西默认就不会备份了
//#import <sys/xattr.h>
- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL*)URL
{
    const char* filePath = [[URL path] fileSystemRepresentation];
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}




#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"沙盒";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"Bundle";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"归档";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"KeyChain 增";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"KeyChain 删";
    }
    if (indexPath.row == 5) {
        cell.textLabel.text = @"KeyChain 改";
    }
    if (indexPath.row == 6) {
        cell.textLabel.text = @"KeyChain 查";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    UIViewController *viewCtr = nil;
    if (indexPath.row == 0) {
        viewCtr = [EOCLocalAnalyseVCtr new];
    }
    if (indexPath.row == 1) {
        viewCtr = [BundleViewCtr new];
    }
    if (indexPath.row == 2) {
       viewCtr = [ArchiveViewCtr new];
    }
    if (indexPath.row == 3) {
        viewCtr = [KeyChainAddVCtr new];
    }
    if (indexPath.row == 4) {
        viewCtr = [KeyChainDeleteVCtr new];
    }
    if (indexPath.row == 5) {
        viewCtr = [KeyChainUpdateVCtr new];
    }
    if (indexPath.row == 6) {
        viewCtr = [KeyChainSearchVCtr new];
    }
    
    [self.navigationController pushViewController:viewCtr animated:YES];
}



@end
