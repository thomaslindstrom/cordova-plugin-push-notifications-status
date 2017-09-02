/**
 * src/ios: PushNotificationsStatus.h
**/

#import <Cordova/CDVPlugin.h>

@interface PushNotificationsStatus : CDVPlugin
    - (void) getStatus: (CDVInvokedUrlCommand*) command;
@end;
