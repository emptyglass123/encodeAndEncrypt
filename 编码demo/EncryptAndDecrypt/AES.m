//
//  AES.m
//  编码demo
//
//  Created by pactera_hui on 2020/8/19.
//  Copyright © 2020 pactera_hui. All rights reserved.
//

#import "AES.h"
#import<CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import "Base64Encode.h"


/// 默认使用kCCOptionPKCS7Padding填充
#define kPaddingMode kCCOptionPKCS7Padding


@implementation AES

//AES128 加密 ECB模式 base64 key
+ (NSString *)AES:(NSString *)content RandomKey:(NSString *)key{
    
    NSData* contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:key options:0];
    
    if ([key length] != 16 && [key length] != 24 && [key length] != 32 ) {
        @throw [NSException exceptionWithName:@"Encrypt"
                                       reason:@"Length of key is wrong. Length of iv should be 16, 24 or 32(128, 192 or 256bits)"
                                     userInfo:nil];
    }
    
    // setup output buffer
    size_t bufferSize = [contentData length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    // do encrypt
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kPaddingMode | kCCOptionECBMode,
                                          [decodedData bytes],     // Key
                                          [decodedData length],    // kCCKeySizeAES
                                          NULL,      // IV
                                          [contentData bytes],
                                          [contentData length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);

    if (cryptStatus != kCCSuccess) {
        free(buffer);
        @throw [NSException exceptionWithName:@"Encrypt"
                                       reason:@"Encrypt Error!"
                                     userInfo:nil];
        return nil;
    }
    NSData *outData = [[NSData alloc] initWithBytes:buffer length:encryptedSize];
    NSString *result = [Base64Encode base64StringFromData:outData length:[outData length]];
    free(buffer);

    return result;
    
}

//AES128 解密 ECB模式 base64 key
+ (NSString *)AESDecrypt:(NSString *)content RandomKey:(NSString *)key{
    
    NSData* contentData = [[NSData alloc] initWithBase64EncodedString:content options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:key options:0];
    
    if ([key length] != 16 && [key length] != 24 && [key length] != 32 ) {
        @throw [NSException exceptionWithName:@"Encrypt"
                                       reason:@"Length of key is wrong. Length of iv should be 16, 24 or 32(128, 192 or 256bits)"
                                     userInfo:nil];
    }
    
    // setup output buffer
    size_t bufferSize = [contentData length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    // do encrypt
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kPaddingMode | kCCOptionECBMode,
                                          [decodedData bytes],     // Key
                                          [decodedData length],    // kCCKeySizeAES
                                          NULL,      // IV
                                          [contentData bytes],
                                          [contentData length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);

    if (cryptStatus != kCCSuccess) {
        free(buffer);
        @throw [NSException exceptionWithName:@"Encrypt"
                                       reason:@"Encrypt Error!"
                                     userInfo:nil];
        return nil;
    }
    NSData *outData = [[NSData alloc] initWithBytes:buffer length:encryptedSize];
    NSString *result = [[NSString alloc] initWithData:outData encoding:NSUTF8StringEncoding];
    free(buffer);

    return result;
    
}


//获得16位的随机数作为AES加密秘钥
+ (NSString *)getRandomKey {
    
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform((float)numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    
    // Turn the result back into a string
    //        NSString *result = [NSString stringWithCharacters:characters length:16];
    
    NSData *str = [[NSData alloc] initWithBytes:characters length:16];
    NSString* str1 = [Base64Encode base64StringFromData:str length:[str length]];
    free(characters);
    
    return str1;
}


@end
