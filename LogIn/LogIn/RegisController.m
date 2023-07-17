//
//  RegisController.m
//  LogIn
//
//  Created by ByteDance on 2023/7/17.
//

#import "RegisController.h"
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
@interface RegisController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation RegisController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
    [self.view addSubview:self.backBtn];
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, SCREEN_SIZE.width - 40, 60)];
        _label.font = [UIFont systemFontOfSize:23];
        _label.text = @"登录界面";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width/2 - 50, 220, 100, 30)];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backBtn.backgroundColor = [UIColor blueColor];
        [_backBtn addTarget:self action:@selector(retu) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (void)retu {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
