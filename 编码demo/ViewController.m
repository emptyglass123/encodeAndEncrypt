//
//  ViewController.m
//  编码demo
//
//  Created by pactera_hui on 2020/8/18.
//  Copyright © 2020 pactera_hui. All rights reserved.
//

#import "ViewController.h"
#import "Base64Encode.h"
#import "AES.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    //字符串 base64编码
//
//    //UTF8字符串——data——base64编码字符串
//    NSString *target = @"012";
//    NSData *data = [target dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *base64Str = [data base64EncodedStringWithOptions:0];
//
//    //UTF8字符串——data——base64、UTF8编码格式的data——base64编码字符串
//    NSData * base64Data = [data base64EncodedDataWithOptions:0];
//    NSString *ret = [[NSString alloc] initWithData:base64Data encoding:NSUTF8StringEncoding];
//    NSString *string = @"123";
//    NSData* dataU8 = [string dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *data64 = [[NSData alloc] initWithBase64EncodedString:string options:0];
//
//
//    Byte dataByte[] = {0X30,0X31,0X32};  // 012
//    NSData *datax = [[NSData alloc] initWithBytes:dataByte length:sizeof(dataByte)];
//
//     NSString *base1 = [Base64Encode base64EncodeData:datax];
//    NSString *base2 = [Base64Encode base64StringFromData:datax length:[datax length]];
//
    
//    NSString *target = @"012";
//    NSData *data = [target dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *base64Str = [data base64EncodedStringWithOptions:0];
//    NSLog(@"%@",base64Str);

    


//    Byte *dataBytes = (Byte *)[data bytes];
    
    [self testAES];
    
}

- (void)testAES{
    
    NSString *testString = @"012";
    NSString *aeskey = [AES getRandomKey];
    NSString *encrpy = [AES AES:testString RandomKey:aeskey];
    NSString *descrypt = [AES AESDecrypt:encrpy RandomKey:aeskey];
    
    NSLog(@"%@%@%@",testString,encrpy,descrypt);
}



@end
