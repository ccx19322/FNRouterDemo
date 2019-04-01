//
//  FNWebViewController.m
//  FNRouterDemo
//
//  Created by iOSgo on 2019/4/1.
//  Copyright © 2019 iOSgo. All rights reserved.
//

#import "FNWebViewController.h"
#import "UIViewController+FNRouter.h"
#import <WebKit/WebKit.h>

@interface FNWebViewController ()
@property(strong, nonatomic) WKWebView *webView;
@property(strong, nonatomic) NSString *urlString;
@end

@implementation FNWebViewController

+ (instancetype)webWithURLString:(NSString*)urlString {
    FNWebViewController *vc = [[self alloc] init];
    vc.urlString = urlString;
    return vc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"webView";
    [self setWKWebView];
    
    if (self.originUrl) {
        self.urlString = self.originUrl.absoluteString;
    }
    
    [self reloadRequest];
    
}


- (void)setWKWebView {
    _webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_webView];
}


- (void)reloadRequest {
    if (_urlString) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]];
        [self.webView loadRequest:request];
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
