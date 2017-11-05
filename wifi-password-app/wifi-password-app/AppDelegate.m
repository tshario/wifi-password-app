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

@property (weak) IBOutlet NSTextField *accountLabel;
@property (weak) IBOutlet NSTextField *passwordLabel;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.window.styleMask = NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask;
    
    CWInterface *wifi = [[CWWiFiClient sharedWiFiClient] interface];
    NSString *account = wifi.ssid;
    NSString *service = @"AirPort";
    NSString *password = [SAMKeychain passwordForService:service account:account];
    
    account = account ?: @"ERROR";
    password = password ?: @"ERROR";
    
    self.accountLabel.stringValue = [NSString stringWithFormat:@"Wi-Fi: %@", account];
    self.passwordLabel.stringValue = [NSString stringWithFormat:@"Password: %@", password];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
