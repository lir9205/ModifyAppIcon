//
//  UIViewController+Extension.m
//  ChangeAPPIcon
//
//  Created by admin on 2018/2/1.
//  Copyright © 2018年 lirui. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>

@implementation UIViewController (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentMethod = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentReplaceMethod = class_getInstanceMethod(self.class, @selector(lr_prensentViewController:animated:completion:));

        method_exchangeImplementations(presentMethod, presentReplaceMethod);
    });
}

- (void)lr_prensentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        NSLog(@"title: %@", ((UIAlertController *)viewControllerToPresent).title);
        NSLog(@"mwssage: %@", ((UIAlertController *)viewControllerToPresent).message);
        
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }
        else {
            [self lr_prensentViewController:viewControllerToPresent animated:flag completion:completion];
            return;
        }
    }
    
    [self lr_prensentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
