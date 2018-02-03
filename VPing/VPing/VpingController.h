//
//  VpingController.h
//  VPing
//
//  Created by Kira Qian on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PingApi.h"

@interface VpingController : NSObject
{
    PingApi *pingClass;
    IBOutlet NSTextView *resutlTextView;
}

- (IBAction)startPing:(id)sender;
@end
