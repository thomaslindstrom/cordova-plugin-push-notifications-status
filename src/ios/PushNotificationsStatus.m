/**
 * src/ios: PushNotificationsStatus.m
**/

#import <Cordova/CDVPlugin.h>
#import "PushNotificationsStatus.h"

@import UserNotifications;

@implementation PushNotificationsStatus
    - (void) getStatus: (CDVInvokedUrlCommand*) command {
        [self.commandDelegate runInBackground: ^{
            @try {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];

                    [center getNotificationSettingsWithCompletionHandler: ^(UNNotificationSettings *settings) {
                        NSMutableString *status = [[NSMutableString alloc] init];

                        switch (settings.authorizationStatus) {
                            case UNAuthorizationStatusAuthorized: {
                                [status setString:@"authorized"];
                                break;
                            }

                            case UNAuthorizationStatusDenied: {
                                [status setString:@"denied"];
                                break;
                            }

                            case UNAuthorizationStatusNotDetermined: {
                                [status setString:@"undetermined"];
                                break;
                            }

                            default: {
                                [status setString:@"unknown"];
                            }
                        }

                        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:status];
                        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                    }];
                });
            }

            @catch (NSException *exception) {
                NSString* reason = [exception reason];
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:reason];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    }
@end;
