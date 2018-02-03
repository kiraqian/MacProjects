//
//  AppController.m
//  EncodeEngine
//
//  Created by Qian Kira on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "Ascii.h"
#import "Core.h"

@implementation AppController
- (IBAction)doEncodeAction:(id)sender
{
    NSString *textToEncode = [mainTextView string];
    NSString *password = [passwordField1 stringValue];
    NSString *passwordCnf = [passwordField2 stringValue];
    
    if ([self checkPasswordMatch:password :passwordCnf]) {
        Core *engineCore = [[Core alloc]init];
        [engineCore initialize:textToEncode :password];
        [mainTextView setString:[engineCore encode]];
    }
}

- (IBAction)doDecodeAction:(id)sender
{
    NSString *textToDecode = [mainTextView string];
    NSString *password = [passwordField1 stringValue];
    Core *engineCore = [[Core alloc]init];
    [engineCore initialize:textToDecode :password];
    [mainTextView setString:[engineCore decode]];
}

- (BOOL)checkPasswordMatch:(NSString *)pw1 :(NSString *)pw2
{
    if (![pw1 isEqualToString:pw2]) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Warning"];
        [alert setInformativeText:@"Password doesn't match!"];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert runModal];
        return FALSE;
    }

    return TRUE;
}
@end
