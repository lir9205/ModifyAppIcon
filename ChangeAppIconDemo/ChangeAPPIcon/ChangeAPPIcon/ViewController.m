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
    
//    NSCalendar *currentCanlender = [NSCalendar currentCalendar];
//    currentCanlender.
//
    
//    arc4random_uniform(31)+1
    [self setAppIconWithName:[NSString stringWithFormat:@"日历%zd",arc4random_uniform(31)+1]];
    
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
