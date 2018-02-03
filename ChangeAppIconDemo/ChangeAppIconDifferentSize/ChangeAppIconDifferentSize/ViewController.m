//
//  ViewController.m
//  ChangeAppIconDifferentSize
//
//  Created by admin on 2018/2/3.
//  Copyright © 2018年 lirui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClicked:(id)sender {

    [self setAppIconWithName:@"日历"];
    
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    noti.alertBody = @"我们看看推送上面的 App 图标";
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
}

- (void)setAppIconWithName:(NSString *)iconName {
    if (![UIApplication sharedApplication].supportsAlternateIcons) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更新APP图标发生错误了：%@", error);
        }
    }];
}

@end
