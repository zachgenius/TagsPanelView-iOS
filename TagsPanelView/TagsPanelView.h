//
//  TagsPanelView.h
//
//  Created by Zach Wang on 15/11/29.
//  Copyright © 2015年 Zach Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTagHeight 30
#define kTagMargin 5
#define kTagPadding 10

@interface TagsPanelView : UIView

@property (nonatomic, strong) NSArray<NSString*>* tagArray;
@property (nonatomic, strong) UIColor* tagBackgroundColor;
@property (nonatomic, strong) UIColor* tagTextColor;
@property (nonatomic, assign) float fontSize;

+ (CGFloat) generatePanelHeightThatFitSize:(CGSize)size tags:(NSArray*)tags fontSize:(CGFloat)fontSize;

@end
