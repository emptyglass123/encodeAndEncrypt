//
//  SKBase64Tool.h
//  编码demo
//
//  Created by pactera_hui on 2020/8/18.
//  Copyright © 2020 pactera_hui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Base64Encode : NSObject


/// Base64编码
/// @param string 待编码字符串
+ (NSString *)base64EncodeString:(NSString *)string;

/// Base64编码
/// @param data 待编码data
+ (NSString *)base64EncodeData:(NSData *)data;


/// Base64解码
/// @param string 待解码字符串
+ (NSString *)base64DeCodeString:(NSString *)string;


/// Base64解码
/// @param string 待解码字符串
+ (NSData *)base64DecodeData:(NSString *)string;



/// Base64编码 重写
/// @param data 待编码data
/// @param length 待编码data 长度
+ (NSString *)base64StringFromData: (NSData *)data length: (NSUInteger)length;



@end

NS_ASSUME_NONNULL_END
