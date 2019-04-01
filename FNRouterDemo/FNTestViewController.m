//
//  FNTestViewController.m
//  FNRouterDemo
//
//  Created by iOSgo on 2019/4/1.
//  Copyright © 2019 iOSgo. All rights reserved.
//

#import "FNTestViewController.h"
#import "UIViewController+FNRouter.h"

@interface FNTestViewController ()

@end

@implementation FNTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.params) {
        self.title = self.params[@"title"];
    }
    
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
