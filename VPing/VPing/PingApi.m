//
//  PingApi.m
//  VPing
//
//  Created by Kira Qian on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PingApi.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation PingApi
- (double)pingHost:(NSString *)hostName
{
    const char *host = [hostName cStringUsingEncoding:NSASCIIStringEncoding];
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL,
                                                                                host);
    CFAbsoluteTime now1 = CFAbsoluteTimeGetCurrent();
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityGetFlags(reachability, &flags);
    CFAbsoluteTime now2 = CFAbsoluteTimeGetCurrent();
    
    CFGregorianUnits units = CFAbsoluteTimeGetDifferenceAsGregorianUnits
    (now2, now1, NULL, kCFGregorianUnitsSeconds);
    
    return units.seconds * 10000;
}

- (NSMutableArray*)getHostList
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"hostlist" 
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    int contentLength = [content length];
    NSMutableArray *hostList = [[NSMutableArray alloc]init];
    NSString *block = [[NSString alloc]init];
    
    for (int i = 0; i < contentLength; i++) {
        char currentChar = [content characterAtIndex:i];
        if (currentChar != ';' && currentChar != '\n') {
            block = [block stringByAppendingFormat:@"%c", currentChar];
        } else if (currentChar == ';') {
            [hostList addObject:block];
            block = @"";
        }
    }

    return hostList;
}
@end
