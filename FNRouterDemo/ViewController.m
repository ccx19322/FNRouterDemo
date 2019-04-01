//
//  ViewController.m
//  FNRouterDemo
//
//  Created by iOSgo on 2019/4/1.
//  Copyright © 2019 iOSgo. All rights reserved.
//

#import "ViewController.h"
#import "FNApplication.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"测试路由";
}

- (IBAction)push1:(id)sender {
    
    [FNApplication openURL:@"http://www.baidu.com"];
    
}

- (IBAction)push2:(id)sender {
    
    [FNApplication openURL:@"home://test/view?title=模块跳转"];
    
}

- (IBAction)push3:(id)sender {
    
    [FNApplication openURL:@"test/view?title=全局跳转"];
}

@end
