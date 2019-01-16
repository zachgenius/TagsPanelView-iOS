# TagsPanelView-iOS
直接绘制Tag到UIView中，可以使tag很多并且在UITableViewCell中时，可以快速显示滑动无卡顿

# Usage
For normal usage, add a TagsPanelView to ViewController

```Objective-c
- (void) viewDidLoad {
	[super viewDidLoad];
	
	NSArray* tags = @[@"Oosaka", @"Kumamoto", @"Kyoto", @"Okinawa"];
	
	TagsPanelView* panelView = [[TagsPanelView alloc] init];
	[self.view addSubview: panelView];
	
	// setting tags;
	panelView.tagArray = tags
	
	// font size. Default is 14;
	panelView.fontSize = 14
	
	// you can only specify some of the colors and others will use the last one;
	panelView.tagsBackgroundColorsArray = @[[UIColor greenColor], [UIColor redColor]];
	
	// generate panel's width and height;
	CGFloat width = [UIScreen mainScreen].bounds.size.width;
	CGFloat height = [TagsPanelView generatePanelHeightThatFitSize:CGSizeMake(width, CGFLOAT_MAX) tags:tags fontSize:14];
	
	// setting frame
	panelView.frame = CGRectMake(0, 10, width, height);
	[panelView setNeedsDisplay];
}
```

For usage in a `UITableCell`, please check out `TagsTableViewCell` in the example project.


#Installation with CocoaPods

```
pod 'TagsPanelView'
```
Easy right?

#Requirements
Requirements? No, eh, maybe. At least it works on iOS 7+.

#License
TagsViewPanel is released under the MIT license. See LICENSE for details.

