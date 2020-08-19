//
//  RSAEncryptor.h
//  编码demo
//
//  Created by pactera_hui on 2020/8/19.
//  Copyright © 2020 pactera_hui. All rights reserved.
//
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSAEncryptor : NSObject

#pragma mark - Instance Methods

-(void) loadPublicKeyFromFile: (NSString*) derFilePath;
-(void) loadPublicKeyFromData: (NSData*) derData;

-(NSString*) rsaEncryptString:(NSString*)string;
-(NSData*) rsaEncryptData:(NSData*)data ;


#pragma mark - Class Methods

+(void) setSharedInstance: (RSAEncryptor*)instance;
+(RSAEncryptor*) sharedInstance;
@end

NS_ASSUME_NONNULL_END
