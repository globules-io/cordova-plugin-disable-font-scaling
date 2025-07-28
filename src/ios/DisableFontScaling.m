#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>

@interface DisableFontScaling : CDVPlugin
@end

@implementation DisableFontScaling

- (void)pluginInitialize {
    NSLog(@"DisableFontScaling: Initializing plugin");
    @try {
        UIView *webView = self.webView;
        if ([webView isKindOfClass:[WKWebView class]]) {
            WKWebView *wkWebView = (WKWebView *)webView;
            // Inject JavaScript to set text size adjust to 100%
            NSString *jsCode = @"document.documentElement.style.webkitTextSizeAdjust = '100%';";
            [wkWebView evaluateJavaScript:jsCode completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"DisableFontScaling: Error injecting JS: %@", error.localizedDescription);
                } else {
                    NSLog(@"DisableFontScaling: Successfully set webkitTextSizeAdjust to 100%");
                }
            }];
        } else {
            NSLog(@"DisableFontScaling: WebView is not WKWebView, type: %@", NSStringFromClass([webView class]));
        }
    } @catch (NSException *exception) {
        NSLog(@"DisableFontScaling: Exception: %@", exception.reason);
    }
}

@end