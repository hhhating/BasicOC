//
//  ViewController.m
//  LogIn
//
//  Created by ByteDance on 2023/7/13.
//

// 登录界面
#import "ViewController.h"
#import "RegisController.h"
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

@interface ViewController ()
@property (nonatomic, strong) UITextField *loginText;
@property (nonatomic, strong) UITextField *passwdText;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *regisBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.loginText];
    [self.view addSubview:self.passwdText];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.regisBtn];
}

- (UITextField *)loginText {
    if (!_loginText) {
        _loginText = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, SCREEN_SIZE.width - 40, 30)];
        _loginText.borderStyle = UITextBorderStyleRoundedRect;
        _loginText.placeholder = @"请输入用户名";
        UIImageView *loginImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 11, 11)];
        loginImage.image = [UIImage imageNamed:@"login_user"];
        _loginText.leftView = loginImage;
        _loginText.leftViewMode = UITextFieldViewModeAlways;
    }
    return _loginText;
}

- (UITextField *)passwdText {
    if (!_passwdText) {
        _passwdText = [[UITextField alloc] initWithFrame:CGRectMake(20, 130, SCREEN_SIZE.width-40, 30)];
        _passwdText.borderStyle = UITextBorderStyleRoundedRect;
        _passwdText.placeholder = @"请输入密码";
        _passwdText.secureTextEntry = YES;
        UIImageView *passedImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 11, 11)];
        passedImage.image = [UIImage imageNamed:@"passswd_user"];
        _passwdText.leftView = passedImage;
        _passwdText.leftViewMode = UITextFieldViewModeAlways;
    }
    return _passwdText;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginBtn.frame = CGRectMake(SCREEN_SIZE.width/4 - 50, 180, 100, 30);
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 10;
        _loginBtn.backgroundColor = [UIColor cyanColor];
        [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)regisBtn {
    if (!_regisBtn) {
        _regisBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _regisBtn.frame = CGRectMake(SCREEN_SIZE.width/4*3 - 50, 180, 100, 30);
        [_regisBtn setTitle:@"注册" forState:UIControlStateNormal];
        _regisBtn.layer.masksToBounds = YES;
        _regisBtn.layer.cornerRadius = 10;
        _regisBtn.backgroundColor = [UIColor cyanColor];
        [_regisBtn addTarget:self action:@selector(regis) forControlEvents:UIControlEventTouchUpInside];
    }
    return _regisBtn;
}

- (void)regis {
    RegisController *con = [[RegisController alloc] init];
    [self presentViewController:con animated:YES completion:nil];
}

- (void)login {
    if (_loginText.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入用户名" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"请输入用户名");
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    if (_passwdText.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"请输入密码");
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"登录成功");
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
