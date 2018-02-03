//
//  AppController.h
//  EncodeEngine
//
//  Created by Qian Kira on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject
{
    IBOutlet NSTextField *passwordField1;
    IBOutlet NSTextField *passwordField2;
    IBOutlet NSTextView *mainTextView;
}

- (IBAction)doEncodeAction:(id)sender;
- (IBAction)doDecodeAction:(id)sender;
- (BOOL)checkPasswordMatch:(NSString*)pw1:(NSString*)pw2;
@end
