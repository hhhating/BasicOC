//
//  STRAutoScrollLabel.h
//  UIText
//
//  Created by ByteDance on 2023/7/24.
//

#import <UIKit/UIKit.h>

@interface STRAutoScrollLabel : UIScrollView

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) NSInteger labelBetweenGap;
@property (nonatomic, assign) NSInteger pauseTime;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, strong) UIColor  *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) BOOL isMarquee;
@property (nonatomic, assign) BOOL isAnimating;
@end
