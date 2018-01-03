//
//  ShadowCornerBtn.m
//  微金在线
//
//  Created by 首控微金财富 on 2017/12/25.
//  Copyright © 2017年 zhouli. All rights reserved.
//

#import "ShadowCornerBtn.h"

@interface ShadowCornerBtn()

@property (nonatomic, assign) BOOL wj_enabled;// default is YES
@property (nonatomic, weak) CAGradientLayer *gradientLayer;
@end

@implementation ShadowCornerBtn

- (void)awakeFromNib
{
    [super awakeFromNib];
     self.wj_enabled = YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
         self.wj_enabled = YES;
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:[UIColor clearColor]];
}

- (void)drawRect:(CGRect)rect
{
    UIColor *color_middle = [UIColor colorWithHexString:@"#ff6a00"];
    CGFloat selfH = rect.size.height;
    self.layer.cornerRadius = selfH/2;
    self.layer.shadowColor = color_middle.CGColor;
    self.layer.shadowOpacity = 0.35f;
    self.layer.shadowOffset = CGSizeMake(0, 3.5 * selfH/41);
    
    if (self.gradientLayer) return;
    UIColor *color_start = RGB(251,138,36);// [UIColor redColor];
    UIColor *color_end = RGB(255,102,0);//[UIColor greenColor];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    CGFloat alpha = self.wj_enabled?1.f:.5;
    gradientLayer.opacity = alpha;
    self.gradientLayer = gradientLayer;
    gradientLayer.colors = @[(__bridge id)color_start.CGColor, (__bridge id)color_middle.CGColor, (__bridge id)color_end.CGColor];
//    gradientLayer.position = self.center;
    gradientLayer.locations = @[@0.0, @.5, @1.0];
    gradientLayer.type = kCAGradientLayerAxial;
    gradientLayer.startPoint = CGPointMake(0, .5);
    gradientLayer.endPoint = CGPointMake(1.f, .6);
    gradientLayer.cornerRadius = selfH/2;
    gradientLayer.masksToBounds = YES;
    gradientLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self.layer insertSublayer:gradientLayer atIndex:0];
//    DLOG(@"gradientLayerdrawRect");
    gradientLayer.shouldRasterize = self.layer.shouldRasterize = YES;
    gradientLayer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)setEnabled:(BOOL)enabled
{
    CGFloat alpha = 0;
    if (enabled == YES) {
        
        alpha = 1.f;
    }else{
        alpha = .5f;
    }
    self.alpha = alpha;
//    [super setEnabled:enabled];
    self.userInteractionEnabled = enabled;
    self.wj_enabled = enabled;
}

- (void)setAlpha:(CGFloat)alpha
{
    CALayer *gradientLayer = self.layer.sublayers.firstObject;
    if ([gradientLayer isKindOfClass:[CAGradientLayer class]]) {
        
        gradientLayer.opacity = alpha;
//        DLOG(@"gradientLayer");
    }
}
@end
