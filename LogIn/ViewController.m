//
//  ViewController.m
//  LogIn
//
//  Created by ByteDance on 2023/7/13.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textField];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 280, 30)];
        // 边框风格
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        // 默认文字
        _textField.placeholder = @"请输入文字";
        // 输入框中文字的颜色，非默认文字的颜色
        _textField.textColor = [UIColor redColor];
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textAlignment = NSTextAlignmentCenter;
        // 为其添加左视图
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"house"]];
        _textField.leftView = imageView;
        // 表示左视图一直存在
        _textField.leftViewMode = UITextFieldViewModeAlways;
        // 设置代理
        _textField.delegate = self;
    }
    return _textField;
}
// 当输入将要开始编辑时系统自动回调的方法，如果设置为 NO，就不会弹起键盘，控件不会进入编辑状态
// 所谓的编辑状态就是光标出现在输入框中并闪烁，键盘弹出等待用户输入的状态
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {}

// 当输入框已经开始编辑时系统自动回调的方法
//- (BOOL)textFieldDidBeginEditing:(UITextField *)textField {}

// 当输入框将要结束编辑时系统自动回调的方法
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {}

// 当输入框已经结束编辑时系统自动回调的方法
//- (BOOL)textFieldDidEndEditing:(UITextField *)textField {}

// 输入框中内容将要改变时系统自动调用的方法，range 是将要改变的字符范围，string 表示将要替换成的字符串，返回的 BOOL 表示字符改变行为是否会成功，判断用户输入内容的合法性一般在这个方法中判断
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    if (string.length > 0) {
        if ([string characterAtIndex:0] < '0' || [string characterAtIndex:0] > '9') {
            NSLog(@"请输入数字");
            return NO;
        }
        if (textField.text.length + string.length > 11) {
            NSLog(@"超过 11 位啦");
            return NO;
        }
    }
    return YES;
}

// 输入框中内容将要清除时系统自动调用的方法，如果返回 NO，表示清除无效
//- (BOOL)textFieldShouldClear:(UITextField *)textField {}

// 用户按键盘上的 return 键后系统自动调用的方法
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {}
@end
