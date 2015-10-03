//
//  ViewController.m
//  NotificationDemo
//
//  Created by qingjie on 10/1/15.
//  Copyright © 2015 qingjie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
static NSString * notificationName = @"PostArticlesSuccessNotification";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   }

- (IBAction)btnTaped:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:@"Object" userInfo:@{@"statu" : @"success"}];
    
    // Pattern 2
//    NSNotification * notification = [NSNotification notificationWithName:notificationName object:@"Object" userInfo:@{@"statu1" : @"success1"}];
//    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
//        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:notificationName object:@"Object" userInfo:@{@"statu1" : @"success1"}]];
    
     [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:notificationName object:@"Object" userInfo:@{@"statu1" : @"success1"}]];
    
}


- (void)NotificationAction: (NSNotification *)note {
    
    NSLog(@"%@", note.name);
    NSLog(@"%@", note.object);
    NSLog(@"%@", note.userInfo);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    // Pattern 1
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificationAction:) name:notificationName object:nil];
    
    
    
    // Pattern 2
    [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        
        NSLog(@"%@", note.name);
        NSLog(@"%@", note.object);
        NSLog(@"%@", note.userInfo);
    }];


}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notificationName object:nil];
}

@end
