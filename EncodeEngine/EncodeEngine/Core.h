//
//  Core.h
//  EncodeEngine
//
//  Created by Qian Kira on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Core : NSObject
{
    NSString *_orgText;
    NSString *_cusText;
}

- (NSString*)encode;
- (NSString*)decode;
- (void)initialize:(NSString*)originalText:(NSString*)customText;
- (int)getEncodeNum:(NSString*)encodeText;
- (char)mappingAlphabet:(char)numChar;
- (char)mappingAlphabet2:(char)strChar;
- (NSString*)mappingString:(NSString*)orgText: (int)direction;
- (NSMutableArray*)getSplitString:(NSString*)stringToSplit;
@end
