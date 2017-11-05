//
//  AppDelegate.m
//  wifi-password-app
//
//  Created by tshario on 05/11/2017.
//  Copyright © 2017 tshario. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreWLAN/CoreWLAN.h>
#import "SAMKeychain.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    CWInterface *wifi = [[CWWiFiClient sharedWiFiClient] interface];
    NSString *account = wifi.ssid;
    NSString *service = @"AirPort";
    NSString *password = [SAMKeychain passwordForService:service account:account];
    NSLog(@"%@", password);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
