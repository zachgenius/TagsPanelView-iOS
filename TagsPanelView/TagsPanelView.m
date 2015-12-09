//
//  TagsPanelView.m
//
//  Created by Zach Wang on 15/11/29.
//  Copyright © 2015年 Zach Wang. All rights reserved.
//

#import "TagsPanelView.h"

@implementation TagsPanelView

- (instancetype)init
{
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void) initView
{
    self.backgroundColor = [UIColor whiteColor];
}

- (float)fontSize
{
    if (!_fontSize) {
        _fontSize = 14;
    }
    
    return _fontSize;
}

- (UIColor *)tagTextColor
{
    if (!_tagTextColor) {
        _tagTextColor = [UIColor whiteColor];
    }
    return _tagTextColor;
}

- (NSArray<UIColor *> *)tagsBackgroundColorsArray
{
    if (_tagsBackgroundColorsArray) {
        return _tagsBackgroundColorsArray;
    }
    _tagsBackgroundColorsArray = @[[UIColor greenColor]];
    return _tagsBackgroundColorsArray;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat width = 0;
    CGFloat height = 0;
    if (self.tagArray.count > 0) {
        int count = 0;
        for (NSString* tag in _tagArray) {
            CGSize textSize = [tag sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.fontSize]}];
            if (width > 0 && width + textSize.width + 2*kTagPadding > rect.size.width) {
                width = 0;
                height += kTagMargin + kTagHeight;
            }
            CGRect theRect = CGRectMake(width, height, textSize.width + 2*kTagPadding, kTagHeight);
            CGColorRef color;
            if (self.tagsBackgroundColorsArray.count > count) {
                color = self.tagsBackgroundColorsArray[count].CGColor;
            }
            else
            {
                color = self.tagsBackgroundColorsArray[self.tagsBackgroundColorsArray.count - 1].CGColor;
            }
            [self drawRoundCornerRect:context rect:theRect solidColor:color];
            [tag drawAtPoint:CGPointMake(width + kTagPadding, height + (kTagHeight - textSize.height)/2.0)
              withAttributes:@{NSForegroundColorAttributeName : self.tagTextColor,
                               NSFontAttributeName : [UIFont systemFontOfSize:self.fontSize]}];
            CGContextSaveGState(context);
            CGContextRestoreGState(context);
            width += textSize.width + kTagMargin + 2*kTagPadding;
            count ++;
        }
    }
    
}

- (void) drawRoundCornerRect:(CGContextRef)context rect:(CGRect)rect solidColor:(CGColorRef)color
{
    int radius = 5;
    
    int startX = rect.origin.x;
    int startY = rect.origin.y;
    
    //移动到初始位置
    CGContextMoveToPoint(context, startX + radius, startY);
    
    //上边
    CGContextAddLineToPoint(context, startX + rect.size.width - radius, startY);
    //右上弧
    CGContextAddArc(context, startX + rect.size.width - radius, startY + radius, radius, -0.5*M_PI, 0.0, 0);
    
    //右边竖线
    CGContextAddLineToPoint(context, startX + rect.size.width, startY + rect.size.height - radius);
    //右下弧
    CGContextAddArc(context, startX + rect.size.width - radius, startY + rect.size.height - radius, radius, 0.0, 0.5*M_PI, 0);
    
    //下边和左下弧
    CGContextAddLineToPoint(context, startX + radius, startY + rect.size.height);
    CGContextAddArc(context, startX + radius, startY + rect.size.height - radius, radius, 0.5 * M_PI, M_PI, 0);
    
    //左边和左上弧
    CGContextAddLineToPoint(context, startX, startY + radius);
    CGContextAddArc(context, startX + radius, startY + radius, radius, M_PI, 1.5 * M_PI, 0);
    
    //闭合
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, color);
    CGContextDrawPath(context, kCGPathFill);
    CGContextSaveGState(context);
    CGContextRestoreGState(context);
}

+ (CGFloat)generatePanelHeightThatFitSize:(CGSize)size tags:(NSArray *)tags fontSize:(CGFloat)fontSize
{
    CGFloat width = 0;
    CGFloat height = 0;
    if (tags.count > 0) {
        for (NSString* tag in tags) {
            CGSize textSize = [tag sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}];
            if (width > 0 && width + textSize.width + 2*kTagPadding > size.width) {
                width = 0;
                height += kTagMargin + kTagHeight;
            }
            width += textSize.width + kTagMargin + 2*kTagPadding;
        }
    }
    
    height += kTagHeight;
    return height;
    
}

@end
