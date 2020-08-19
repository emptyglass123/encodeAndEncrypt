//
//  SKBase64Tool.m
//  编码demo
//
//  Created by pactera_hui on 2020/8/18.
//  Copyright © 2020 pactera_hui. All rights reserved.
//

/*
 NSDataBase64Encoding64CharacterLineLength：每64个字符插入\r或\n
 NSDataBase64Encoding76CharacterLineLength：每76个字符插入\r或\n
 
 NSDataBase64EncodingEndLineWithCarriageReturn：插入字符为\r
 NSDataBase64EncodingEndLineWithLineFeed：插入字符为\n
 
 1.前两个选项为是否允许插入字符，以及多少个字符长度插入，两个可以选其一或者都不选。
 2.后两个选项代表要插入的具体字符。
 3.比如我们想76个字符后插入一个\r则可以:
 4.NSDataBase64Encoding76CharacterLineLength | NSDataBase64EncodingEndLineWithCarriageReturn
 5.而在上面举的例子中选项为0，则代表不插入字符。

 */
#import "Base64Encode.h"

static char base64EncodingTable[64] = {
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
  'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
  'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
  'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};
@implementation Base64Encode

/// Base64编码
/// @param string 待编码字符串
+ (NSString *)base64EncodeString:(NSString *)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}


/// Base64编码
/// @param data 待编码data
+ (NSString *)base64EncodeData:(NSData *)data{
    return [data base64EncodedStringWithOptions:0];
}


/// Base64解码
/// @param string 待解码字符串
+ (NSString *)base64DeCodeString:(NSString *)string{
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    return ret;
}


/// Base64解码
/// @param string 待解码字符串
+ (NSData *)base64DecodeData:(NSString *)string{
    return  [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
}


+ (NSString *)base64StringFromData: (NSData *)data length: (NSUInteger)length {
  unsigned long ixtext, lentext;
  long ctremaining;
  unsigned char input[3], output[4];
  short i, charsonline = 0, ctcopy;
  const unsigned char *raw;
  NSMutableString *result;
  
  lentext = [data length];
  if (lentext < 1) {
    return @"";
  }
  result = [NSMutableString stringWithCapacity: lentext];
  raw = [data bytes];
  ixtext = 0;
  
  while (true) {
    ctremaining = lentext - ixtext;
    if (ctremaining <= 0) {
      break;
    }
    for (i = 0; i < 3; i++) {
      unsigned long ix = ixtext + i;
      if (ix < lentext) {
        input[i] = raw[ix];
      }
      else {
        input[i] = 0;
      }
    }
    output[0] = (input[0] & 0xFC) >> 2;
    output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
    output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
    output[3] = input[2] & 0x3F;
    ctcopy = 4;
    switch (ctremaining) {
      case 1:
        ctcopy = 2;
        break;
      case 2:
        ctcopy = 3;
        break;
    }
    
    for (i = 0; i < ctcopy; i++) {
      [result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
    }
    
    for (i = ctcopy; i < 4; i++) {
      [result appendString: @"="];
    }
    
    ixtext += 3;
    charsonline += 4;
    
    if ((length > 0) && (charsonline >= length)) {
      charsonline = 0;
    }
  }
  return result;
}




@end
