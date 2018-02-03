//
//  PingApi.h
//  VPing
//
//  Created by Kira Qian on 1/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PingApi : NSObject
- (double)pingHost:(NSString*) hostName;
- (NSMutableArray*)getHostList;
@end
