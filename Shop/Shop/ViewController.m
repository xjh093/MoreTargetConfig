//
//  ViewController.m
//  Shop
//
//  Created by HaoCold on 2020/3/21.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "ViewController.h"

#if SHOP2
#define kTitle @"Shop2"

#import "Shop2Cell.h"
#import "Shop2Ctrl.h"

#else

#define kTitle @"Shop"

#import "ShopCell.h"
#import "ShopCtrl.h"

#endif

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,  strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = kTitle;
    
    [self.view addSubview:self.tableView];
}


#pragma mark --- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"resueID";
#if SHOP2
    Shop2Cell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[Shop2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Shop2 商品，第%@行",@(indexPath.row)];
#else
    ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Shop 商品，第%@行",@(indexPath.row)];
#endif
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
#if SHOP2
    Shop2Ctrl *ctrl = [[Shop2Ctrl alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
#else
    ShopCtrl *ctrl = [[ShopCtrl alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
#endif
}

#pragma mark --- lazy
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:0];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 50;
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = tableView;
        
#if SHOP2
        [tableView registerClass:[Shop2Cell class] forCellReuseIdentifier:@"resueID"];
#else
        [tableView registerClass:[ShopCell class] forCellReuseIdentifier:@"resueID"];
#endif
    }
    return _tableView;
}
@end
