//
//  AppDelegate.m
//  Push App
//
//  Created by Miguel Melendez on 6/18/16.
//  Copyright © 2016 Miguel Melendez. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    application.applicationIconBadgeNumber = 0;
    
    UILocalNotification *localNote = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNote){
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received On Launch" message:localNote.alertBody preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
        
        [ac addAction:aa];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:ac animated: YES completion:nil];
        });
    }
    return YES;
}

- (void) application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(nonnull UILocalNotification *)notification completionHandler:(nonnull void (^)())completionHandler {
    application.applicationIconBadgeNumber = 0;
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received On Action" message:identifier preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    
    [ac addAction:aa];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:ac animated: YES completion:nil];
    });
    
    completionHandler();
}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification {
    application.applicationIconBadgeNumber = 0;
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received While Running" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
    
    [ac addAction:aa];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:ac animated: YES completion:nil];
    });
}
@end
