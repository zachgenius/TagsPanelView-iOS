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

/**
 *  tags in single line
 */
@property (nonatomic, strong) NSArray<NSString*>* tagArray;

/**
 *  tag text color. Default is white
 */
@property (nonatomic, strong) UIColor* tagTextColor;

/**
 *  colors' array for tags. 
 *  if tagArray.count > tagsBackgroundColorsArray.count,
 *  other tags will use the last color of tagsBackgroundColorsArray.
 *  Default is green
 */
@property (nonatomic, strong) NSArray<UIColor*> *tagsBackgroundColorsArray;

/**
 *  font size. Default is 14
 */
@property (nonatomic, assign) float fontSize;

+ (CGFloat) generatePanelHeightThatFitSize:(CGSize)size tags:(NSArray*)tags fontSize:(CGFloat)fontSize;

@end
