//
//  Core.m
//  EncodeEngine
//
//  Created by Qian Kira on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Core.h"
#import "Ascii.h"

@implementation Core
- (void)initialize:(NSString*)originalText:(NSString*)customText
{
    _orgText = originalText;
    _cusText = customText;
}

- (NSString*)encode
{
    int encodeInt = [self getEncodeNum:_cusText];
    long length = [_orgText length];
    char splitChar = ',';
    NSString *retText = [[NSString alloc]init];
    for (int i = 0; i < length; i++) {
        unichar tmpChar = [_orgText characterAtIndex:i];
        int tmpInt = [Ascii getAsciiCode:tmpChar];
        int afterEncode = tmpInt + encodeInt;
        retText = [retText stringByAppendingFormat:@"%d", afterEncode];
        if (i < length - 1) {
            retText = [retText stringByAppendingFormat:@"%c", splitChar];
        }
    }
    return [self mappingString:retText :1];
}

- (NSString*)decode
{
    int encodeInt = [self getEncodeNum:_cusText];
    NSString *orgTextMapping = [self mappingString:_orgText :2];
    NSString *retText = [[NSString alloc]init];
    NSMutableArray *lines = [self getSplitString:orgTextMapping];
    for (int i = 0; i < [lines count]; i++) {
        int tmpInt = [[lines objectAtIndex:i] intValue];
        tmpInt -= encodeInt;
        unichar tmpChar = [Ascii asciiToChar:tmpInt];
        retText = [retText stringByAppendingFormat:@"%C", tmpChar];
    }
    
    return retText;
}

- (NSMutableArray*)getSplitString:(NSString*)stringToSplit
{
    NSMutableArray *retArray = [[NSMutableArray alloc]init];
    long length = [stringToSplit length];
    NSString *element = [[NSString alloc]init];
    for (int i = 0; i < length; i++) {
        char elementChar = [stringToSplit characterAtIndex:i];
        if (elementChar != ',') 
        {
            element = [element stringByAppendingFormat:@"%c", elementChar];
        }
        else if(elementChar == ',')
        {
            [retArray addObject:element];
            element = @"";
        }
        
        if(i == length - 1)
        {
            [retArray addObject:element];
        }
    }
    return retArray;
}

- (int)getEncodeNum:(NSString *)encodeText
{
    long length = [encodeText length];
    int retInt = 0;
    for (int i = 0; i < length; i++) {
        unichar tmpChar = [encodeText characterAtIndex:i];
        int encodeInt = [Ascii getAsciiCode:tmpChar];
        retInt += encodeInt;
    }
    
    return retInt;
}

- (char)mappingAlphabet:(char)numChar
{
    switch (numChar)
    {
        case '0': return 'A';
        case '1': return 'B';
        case '2': return 'C';
        case '3': return 'D';
        case '4': return 'E';
        case '5': return 'F';
        case '6': return 'G';
        case '7': return 'H';
        case '8': return 'I';
        case '9': return 'J';
        case ',': return 'K';
        default: return '?';
    }
}

- (char)mappingAlphabet2:(char)strChar
{
    switch (strChar)
    {
        case 'A': return '0';
        case 'B': return '1';
        case 'C': return '2';
        case 'D': return '3';
        case 'E': return '4';
        case 'F': return '5';
        case 'G': return '6';
        case 'H': return '7';
        case 'I': return '8';
        case 'J': return '9';
        case 'K': return ',';
        default: return '?';
    }
}

- (NSString*)mappingString:(NSString *)orgText :(int)direction
{
    NSString *retText = [[NSString alloc]init];
    long length = [orgText length];
    if (direction == 1) {
        for (int i = 0; i < length; i++) 
        {
            char mappedChar = [self mappingAlphabet:[orgText characterAtIndex:i]];
            retText = [retText stringByAppendingFormat:@"%c", mappedChar];
        }
    }
    else
    {
        for (int i = 0; i < length; i++) 
        {
            char mappedChar = [self mappingAlphabet2:[orgText characterAtIndex:i]];
            retText = [retText stringByAppendingFormat:@"%c", mappedChar];
        }
    }
    
    return retText;
}
@end
