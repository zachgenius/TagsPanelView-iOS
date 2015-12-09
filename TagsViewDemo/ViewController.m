//
//  ViewController.m
//  TagsViewDemo
//
//  Created by Zach Wang on 15/11/29.
//  Copyright © 2015年 Zach Wang. All rights reserved.
//

#import "ViewController.h"
#import "TagsTableViewCell.h"
#import "TagsPanelView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableDictionary* _cellHeightDictionary;
    NSArray* _tagsArray;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellHeightDictionary = [[NSMutableDictionary alloc] init];
    
    _tagsArray = @[
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun",@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun",@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   @[@"Shanghai",@"Beijing", @"Guangzhou", @"Shenzhen", @"Chengdu", @"Chongqing", @"Xiamen", @"Yichun"],
                   @[@"Oosaka", @"Tokyo", @"Kyoto", @"Fukuoka", @"Kumamoto", @"Hokaito", @"Kyushu", @"Okinawa"],
                   @[@"New York", @"Washington",@"New Orleans", @"Nevada", @"Delaware"],
                   ];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - getters
- (UITableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[TagsTableViewCell class] forCellReuseIdentifier:@"cell"];
    return _tableView;
}

#pragma mark - delegate & datasources;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tagsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_cellHeightDictionary[indexPath]) {
        return [_cellHeightDictionary[indexPath] floatValue];
    }
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    CGFloat height = [TagsTableViewCell generateCellHeightWithTags:_tagsArray[indexPath.row] byWidth:screenSize.width];
    _cellHeightDictionary[indexPath] = @(height);
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TagsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.tagArray = _tagsArray[indexPath.row];
    return cell;
}

@end
