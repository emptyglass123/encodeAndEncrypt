//
//  UrlEncode.m
//  编码demo
//
//  Created by pactera_hui on 2020/8/19.
//  Copyright © 2020 pactera_hui. All rights reserved.
//

#import "UrlEncode.h"

@implementation UrlEncode

+(NSString*)urlEncodeWithString:(NSString*)unencodedString{
    
    NSString*encodedString=(NSString*)
    
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    return encodedString;
}


@end
