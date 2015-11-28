//
//  TagsTableViewCell.h
//  TagsViewDemo
//
//  Created by Zach Wang on 15/11/29.
//  Copyright © 2015年 Zach Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TagsPanelView;
@interface TagsTableViewCell : UITableViewCell
@property (nonatomic, strong) NSArray<NSString*>* tagArray;
@property (nonatomic, strong, readonly) TagsPanelView *tagPanelView;
+ (CGFloat)generateCellHeightWithTags:(NSArray<NSString*> *)tags byWidth:(CGFloat) width;
@end
