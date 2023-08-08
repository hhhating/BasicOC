//
//  ViewController.h
//  UIText
//
//  Created by ByteDance on 2023/7/21.
//
#import <UIKit/UIKit.h>

/**
 文字滚动方向
 
 - SALabelScrollLeft: 从右向左
 - SALabelScrollRight: 从左向右
 */
typedef NS_ENUM(NSInteger, SAMarqueeLabelDirection) {
    SAMarqueeLabelLeft,
    SAMarqueeLabelRight
};

/**
 animation 实现跑马灯样式 label
 */
@interface ViewController :UIViewController

/** 文字 */
@property (nonatomic, copy, nullable) NSString *text;

/** 富文本 */
@property (nonatomic, copy, nullable) NSAttributedString *attributedText;

/** 文字颜色*/
@property (nonatomic, strong, nonnull) UIColor *textColor;

/** 文字font */
@property (nonatomic, strong, nonnull) UIFont *font;

/** 文字阴影颜色 */
@property (nonatomic, strong, nullable) UIColor *shandowColor;

/** 文字阴影偏移 */
@property (nonatomic, assign) CGSize shandowOffset;

/** 文字位置，只在文字不滚动时有效 */
@property (nonatomic, assign) NSTextAlignment textAlignment;

/** 滚动方向，默认 SAMarqueeLabelLeft */
@property (nonatomic, assign) SAMarqueeLabelDirection marqueeDirection;

/** 滚动速度，默认30 */
@property (nonatomic, assign) CGFloat scrollSpeed;

/** 是否可以滚动 */
@property (nonatomic, readonly, assign) BOOL isScroll;

@end

