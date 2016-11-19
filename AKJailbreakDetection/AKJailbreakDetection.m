//
//  AKJailbreakDetection.m
//  AKJailbreakDetection
//
//  Copyright © 2016 Aryan Kashyap. All rights reserved.
//

#import "AKJailbreakDetection.h"

@implementation AKJailbreakDetection

+ (BOOL)isJailbroken
{
   #if !(TARGET_IPHONE_SIMULATOR)
   
    FILE *file = fopen("/Applications/Cydia.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    
    file = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/bin/bash", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    
    file = fopen("/usr/sbin/sshd", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    
    file = fopen("/etc/apt", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    
    file = fopen("/usr/bin/ssh", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:@"/Applications/Cydia.app"]) {
        return YES;
        
    } else if ([fileManager fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
        return YES;
        
    } else if ([fileManager fileExistsAtPath:@"/bin/bash"]) {
        return YES;
        
    } else if ([fileManager fileExistsAtPath:@"/usr/sbin/sshd"]) {
        return YES;
        
    } else if ([fileManager fileExistsAtPath:@"/etc/apt"]) {
        return YES;
        
    } else if ([fileManager fileExistsAtPath:@"/usr/bin/ssh"]) {
        return YES;
        
    }
    
    // Check if the application can access outside of its sandbox
    NSError *error = nil;
    NSString *str = @".";
    
    [str writeToFile:@"/private/jailbreak.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        return YES;
    } else {
        [fileManager removeItemAtPath:@"/private/jailbreak.txt" error:nil];
    }
    
    // Check if app can open Cydias URL Scheme
    if([[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString: @"cydia://package/com.example.package"]]){
        return YES;
    }
    
    #endif
    
    return NO;
}

@end
