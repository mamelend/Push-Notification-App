//
//  ViewController.m
//  Push App
//
//  Created by Miguel Melendez on 6/18/16.
//  Copyright © 2016 Miguel Melendez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) requestPermissionToNotify;

- (void) createNotification:(int)secondsInTheFuture;

@end

@implementation ViewController
- (IBAction)scheduleButtonPressed:(id)sender {
    [self requestPermissionToNotify];
    [self createNotification:15];
}

- (void) requestPermissionToNotify {
    
    UIMutableUserNotificationAction *floatAction = [[UIMutableUserNotificationAction alloc] init];
    floatAction.identifier = @"FLOAT_ACTION";
    floatAction.title = @"Float";
    floatAction.activationMode = UIUserNotificationActivationModeBackground;
    floatAction.destructive = YES;
    floatAction.authenticationRequired = NO;
    
    UIMutableUserNotificationAction *stingAction = [[UIMutableUserNotificationAction alloc] init];
    stingAction.identifier = @"STING_ACTION";
    stingAction.title = @"STING";
    stingAction.activationMode = UIUserNotificationActivationModeForeground;
    stingAction.destructive = NO;
    stingAction.authenticationRequired = NO;
    
    UIMutableUserNotificationCategory *responseCategory = [[UIMutableUserNotificationCategory alloc]init];
    responseCategory.identifier = @"MAIN_CAT";
    [responseCategory setActions:@[floatAction, stingAction] forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObjects:responseCategory, nil];
    
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
}

- (void) createNotification:(int)secondsInTheFuture {
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    localNote.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInTheFuture];
    localNote.timeZone = nil;
    
    localNote.alertTitle = @"Alert Title";
    localNote.alertBody = @"Alert Body";
    localNote.alertAction = @"Okay";
    localNote.soundName = UILocalNotificationDefaultSoundName;
    localNote.applicationIconBadgeNumber = 1;
    localNote.category = @"MAIN_CAT";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
