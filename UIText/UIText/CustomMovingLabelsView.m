//
//  CustomMovingLabelsView.m
//  UIText
//
//  Created by ByteDance on 2023/7/26.
//

#import "CustomMovingLabelsView.h"

@interface CustomMovingLabelsView ()
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@end

@implementation CustomMovingLabelsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLabels];
        [self startMovingAnimation];
    }
    return self;
}

- (void)setupLabels {
    CGFloat labelWidth = 45;
    CGFloat labelHeight = 20;
    CGFloat labelSpacing = 15;
    CGFloat totalWidth = labelWidth * 2 + labelSpacing;

    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
    self.label1.text = @"Label 1";
    [self addSubview:self.label1];

    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(totalWidth, 0, labelWidth, labelHeight)];
    self.label2.text = @"Label 2";
    [self addSubview:self.label2];
}

- (void)startMovingAnimation {
    CGFloat totalWidth = self.label1.frame.size.width * 2 + 15;
    CGFloat duration = 5.0;

    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionRepeat animations:^{
        self.label1.frame = CGRectOffset(self.label1.frame, -totalWidth, 0);
        self.label2.frame = CGRectOffset(self.label2.frame, -totalWidth, 0);
    } completion:nil];
}

@end

