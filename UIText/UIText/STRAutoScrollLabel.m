#import "STRAutoScrollLabel.h"

#define AutoLabel_speed 30
#define AutoLabel_betweenGap 10
#define NumLabels 2
#define AutoLabel_pause 0.1

@interface STRAutoScrollLabel()
@property (nonatomic, strong) NSArray<UILabel *> *labels;
@end

@implementation STRAutoScrollLabel

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI{
    NSMutableArray *tempLabels = [NSMutableArray array];
    for (NSInteger i = 0; i < NumLabels; i++) {
        UILabel *label = [[UILabel alloc] init];
        [label setBackgroundColor:[UIColor clearColor]];
        [self addSubview:label];
        [tempLabels addObject:label];
    }
    _labels = [tempLabels copy];
    _labelBetweenGap = AutoLabel_betweenGap;
    _speed = AutoLabel_speed;
    _pauseTime = AutoLabel_pause;
}

- (void)rejustlabels{
    [self.layer removeAllAnimations];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    CGFloat offset = 0.0f;
    for (NSInteger i = 0; i < NumLabels; i++) {
        [_labels[i] sizeToFit];
        CGPoint center = _labels[i].center;
        center.y = self.center.y - self.frame.origin.y;
        _labels[i].center = center;

        CGRect frame = _labels[i].frame;
        frame.origin.x = offset;
        _labels[i].frame = frame;

        offset += _labels[i].frame.size.width+_labelBetweenGap;
    }

    if (_labels[0].frame.size.width > self.frame.size.width) {
        //show lab
        for (NSInteger i = 1; i <NumLabels; i++) {
            _labels[i].hidden = NO;
        }
        if (_isMarquee) {
            [self scroll];
        }
    }else{
        for (NSInteger i = 1; i < NumLabels; i++) {
            _labels[i].hidden = YES;
        }
        CGPoint center = _labels[0].center;
        center.x = self.center.x - self.frame.origin.x;
        _labels[0].center = center;
    }
}

- (void)scroll {
    // 添加isAnimating的判断，避免频繁点击UISwitch导致多个动画同时进行
    if (self.isAnimating) {
        return;
    }
    
    // 设置isAnimating为YES，表示正在执行动画
    self.isAnimating = YES;
    
    [self.layer removeAllAnimations];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    self.contentOffset = CGPointMake(0, 0);
    
    [UIView animateWithDuration:_labels[0].frame.size.width / _speed
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         CGRect frame1 = self->_labels[0].frame;
                         CGRect frame2 = self->_labels[1].frame;
                         frame1.origin.x -= frame1.size.width + self->_labelBetweenGap;
                         frame2.origin.x -= frame2.size.width + self->_labelBetweenGap;
                         self->_labels[0].frame = frame1;
                         self->_labels[1].frame = frame2;
                     } completion:^(BOOL finished) {
                         // 动画完成后执行回调
                         if (self->_isMarquee) {
                             if (finished && self->_labels[0].frame.size.width > self.frame.size.width) {
                                 [self performSelector:@selector(scroll) withObject:nil afterDelay:self->_pauseTime];
                             }
                         } else {
                             [self rejustlabels];
                         }
                         // 动画完成后设置isAnimating为NO
                         self.isAnimating = NO;
                     }];
}

- (void)setText:(NSString *)text{
    if ([text isEqualToString:_labels[0].text]) {
        if (_labels[0].frame.size.width > self.frame.size.width) {
            [self scroll];
        }
        return;
    }
    for (NSInteger i = 0; i< NumLabels; i++) {
        _labels[i].text = text;
    }
    [self rejustlabels];
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    for (NSInteger i = 0; i < NumLabels; i++) {
        _labels[i].textColor = textColor;
    }
}

- (void)setFont:(UIFont *)font {
    _font = font;
    for (NSInteger i = 0; i < NumLabels; i++) {
        _labels[i].font = font;
    }
}

- (void)setIsMarquee:(BOOL)isMarquee {
    _isMarquee = isMarquee;
    [self rejustlabels];
}
@end

