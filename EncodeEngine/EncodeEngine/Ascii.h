//
//  Ascii.h
//  EncodeEngine
//
//  Created by Qian Kira on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ascii : NSObject
+ (int)getAsciiCode:(unichar)character;
+ (unichar)asciiToChar:(int)int32Value;
@end