//
//  AES.h
//  编码demo
//
//  Created by pactera_hui on 2020/8/19.
//  Copyright © 2020 pactera_hui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AES : NSObject


//AES128 加密 ECB模式 base64 key
+ (NSString *)AES:(NSString *)content RandomKey:(NSString *)key;


//AES128 解密 ECB模式 base64 key
+ (NSString *)AESDecrypt:(NSString *)content RandomKey:(NSString *)key;


//获得16位的随机数作为AES加密秘钥
+ (NSString *)getRandomKey;


@end

NS_ASSUME_NONNULL_END
