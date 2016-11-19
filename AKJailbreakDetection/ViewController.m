//
//  ViewController.m
//  AKJailbreakDetection
//
//  Created by Aryan Kashyap on 19/11/2016.
//  Copyright © 2016 Aryan Kashyap. All rights reserved.
//

#import "ViewController.h"
#import "AKJailbreakDetection.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([AKJailbreakDetection isJailbroken]) {
        
        // It will execute the code below if the device is jailbroken..
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hi!"
                                                                                 message:@"Looks like this device is jailbroken"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction *action) {
                                                                 // Do nothing
                                                             }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
