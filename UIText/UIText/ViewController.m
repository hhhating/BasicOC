//
//  ViewController.m
//  UILabel-Marquee
//
//  Created by ByteDance on 2023/7/21.
//

#import "ViewController.h"
#import "CustomMovingLabelsView.h"
#import "STRAutoScrollLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Replace CGRectMake with the desired frame for your custom view
//    CustomMovingLabelsView *movingLabelsView = [[CustomMovingLabelsView alloc] initWithFrame:CGRectMake(50, 100, 150, 20)];
//    [self.view addSubview:movingLabelsView];
    STRAutoScrollLabel *autoLabel = [[STRAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 100, 150, 20)];
    autoLabel.text = @"哈哈哈哈";
    [self.view addSubview:autoLabel];
}

@end

