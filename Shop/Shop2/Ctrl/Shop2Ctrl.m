//
//  Shop2Ctrl.m
//  Shop2
//
//  Created by HaoCold on 2020/3/21.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "Shop2Ctrl.h"
#import "MJExtension.h"
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

@interface Shop2Ctrl ()

@end

@implementation Shop2Ctrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"MJExtesion";
    self.view.backgroundColor = [UIColor whiteColor];
    
    Class cls0 = NSClassFromString(@"NSObject");
    Class cls1 = NSClassFromString(@"YYModel");
    Class cls2 = NSClassFromString(@"MJExtesion");
    
    NSLog(@"import only MJExtesion");
    NSLog(@"cls0:%@",cls0);
    NSLog(@"cls1:%@",cls1);
    NSLog(@"cls2:%@",cls2);
    
    // create model from json
    
#if 1
    YYBook *book = [YYBook mj_objectWithKeyValues:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];
    NSLog(@"%@",book);
    
    NSString *json = [book mj_JSONString];
    NSLog(@"%@",json);
    // {"name":"Harry Potter","pages":256,"author":{"name":"J.K.Rowling"}}
#else
    [YYBook yy_modelWithJSON:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];
    NSLog(@"%@",book);
    
    // convert model to json
    NSString *json = [book yy_modelToJSONString];
    NSLog(@"%@",json);
    // {"author":{"name":"J.K.Rowling","birthday":"1965-07-31T00:00:00+0000"},"name":"Harry Potter","pages":256}
#endif
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
