//
//  ViewController.h
//  EOCDataStore
//
//  Created by EOC on  /5/18.
//  Copyright ©     EOC. All rights reserved.
//

#import <UIKit/UIKit.h>

/*


 
 文件夹:documents 和 Caches
 
 Library {
     Caches  缓存(比如系统截屏,网络缓存等 )  默认备份
     Preferences（默认是备份）（plist文件 NSUserDefaults）
 
 }
 tmp (临时)
 // app功能 清除缓存的功能 （1系统的文件， 2 自己创建）
 
 =======
 boundle  资源， 不参与编译
 黄色/蓝色(蓝色资源文件夹，不参与编译)
 
 ======
 归档 （对象存本地）
 
 */
@interface ViewController : UIViewController


@end

