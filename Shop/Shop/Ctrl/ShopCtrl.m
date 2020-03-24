//
//  ShopCtrl.m
//  Shop
//
//  Created by HaoCold on 2020/3/21.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "ShopCtrl.h"
#import "YYModel.h"

@interface YYAuthor : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSDate *birthday;
@end
@implementation YYAuthor
@end

@interface YYBook : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger pages;
@property (nonatomic, strong) YYAuthor *author;
@end
@implementation YYBook
@end

@interface ShopCtrl ()

@end

@implementation ShopCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"YYModel";
    self.view.backgroundColor = [UIColor whiteColor];
    
    Class cls0 = NSClassFromString(@"NSObject");
    Class cls1 = NSClassFromString(@"YYModel");
    Class cls2 = NSClassFromString(@"MJExtesion");
    
    NSLog(@"import only YYModel");
    NSLog(@"cls0:%@",cls0);
    NSLog(@"cls1:%@",[cls1 new]);
    NSLog(@"cls2:%@",[cls2 new]);
    
    // create model from json
    YYBook *book = [YYBook yy_modelWithJSON:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];
    NSLog(@"%@",book);
    
    // convert model to json
    NSString *json = [book yy_modelToJSONString];
    NSLog(@"%@",json);
    // {"author":{"name":"J.K.Rowling","birthday":"1965-07-31T00:00:00+0000"},"name":"Harry Potter","pages":256}
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
