//
//  ViewController.m
//  ChangeAPPIcon
//
//  Created by admin on 2018/2/1.
//  Copyright © 2018年 lirui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)buttonClicked:(id)sender {
    
    NSDate * date  = [NSDate date];
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法 NSCalendarIdentifierGregorian,NSGregorianCalendar
    // NSDateComponent 可以获得日期的详细信息，即日期的组成
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday fromDate:date];

    [self setAppIconWithName:[NSString stringWithFormat:@"日历%zd",comps.day]];
    
}

- (IBAction)testAlertView:(id)sender {
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:@"试试 AlertViewController 能不能正常使用" preferredStyle:UIAlertControllerStyleAlert];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"可以" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertVc animated:YES completion:nil];
}



- (IBAction)PresentViewController:(id)sender {
    [self presentViewController:[[UIViewController alloc]init] animated:YES completion:nil];
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
