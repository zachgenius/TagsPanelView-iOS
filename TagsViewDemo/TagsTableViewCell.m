//
//  TagsTableViewCell.m
//  TagsViewDemo
//
//  Created by Zach Wang on 15/11/29.
//  Copyright © 2015年 Zach Wang. All rights reserved.
//

#import "TagsTableViewCell.h"
#import "TagsPanelView.h"

@implementation TagsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _tagPanelView = [[TagsPanelView alloc] initWithFrame:self.frame];
        [self addSubview:_tagPanelView];
    }
    return self;
}
- (void)setTagArray:(NSArray<NSString *> *)tagArray
{
    _tagArray = tagArray;
    _tagPanelView.tagArray = tagArray;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    float panelHeight = [TagsPanelView generatePanelHeightThatFitSize:CGSizeMake(width, CGFLOAT_MAX) tags:tagArray fontSize:16];
    _tagPanelView.frame = CGRectMake(0, 10, width, panelHeight);
    [_tagPanelView setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGFloat minHeight = kTagHeight + 2*10;
    CGFloat panelHeight = _tagPanelView.frame.size.height + 15;
    return CGSizeMake(size.width, MAX(minHeight, panelHeight));
}

+ (CGFloat)generateCellHeightWithTags:(NSArray<NSString*> *)tags byWidth:(CGFloat) width
{
    CGFloat minHeight = kTagHeight + 2*10;
    CGFloat tagPanelHeight = [TagsPanelView generatePanelHeightThatFitSize:CGSizeMake(width, CGFLOAT_MAX) tags:tags fontSize:16] + 20;
    return MAX(minHeight, tagPanelHeight);
}
@end
