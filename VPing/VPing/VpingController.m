//
//  VpingController.m
//  VPing
//
//  Created by Kira Qian on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VpingController.h"
#import "PingApi.h"

@implementation VpingController
- (IBAction)startPing:(id)sender
{
    pingClass = [[PingApi alloc]init];
    NSString *resultText = [[NSString alloc]init];
    NSMutableArray *hostList = [pingClass getHostList];
    int count = [hostList count];
    for (int i = 0; i < count; i++) {
        NSString *hostName = [hostList objectAtIndex:i];
        double pingValue = [pingClass pingHost:hostName];
        NSString *stringValue = [NSString stringWithFormat:@"%@: %f\n\n", hostName, pingValue];
        resultText = [resultText stringByAppendingString:stringValue];
    }
    
    [resutlTextView setString:resultText];
}


@end
