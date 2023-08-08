//
//  ViewController.h
//  MySafari
//
//  Created by ByteDance on 2023/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 提供给外界的一个加载网页地址的接口
- (void)loadURL:(NSString *)urlStr;

@end

