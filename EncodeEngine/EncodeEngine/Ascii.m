//
//  Ascii.m
//  EncodeEngine
//
//  Created by Qian Kira on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Ascii.h"

@implementation Ascii
+ (int)getAsciiCode:(unichar)character
{
    return (int)character;
}

+ (unichar)asciiToChar:(int)int32Value
{
    return (unichar)int32Value;
}
@end
