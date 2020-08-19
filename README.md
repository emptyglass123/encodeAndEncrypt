# encodeAndEncrypt


常用的编码加密整理：

1.Base64 编码与解码
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

2.常用的哈希摘要算法

/// 返回结果：32长度(128位，16字节，16进制字符输出则为32字节长度)   终端命令：md5 -s "123"
- (NSString *)md5Hash;

/// 返回结果：40长度   终端命令：echo -n "123" | openssl sha -sha1
- (NSString *)sha1Hash;

/// 返回结果：56长度   终端命令：echo -n "123" | openssl sha -sha224
- (NSString *)sha224Hash;

/// 返回结果：64长度   终端命令：echo -n "123" | openssl sha -sha256
- (NSString *)sha256Hash;

- (NSData *)sha256HashData;

/// 返回结果：96长度   终端命令：echo -n "123" | openssl sha -sha384
- (NSString *)sha384Hash;

/// 返回结果：128长度   终端命令：echo -n "123" | openssl sha -sha512
- (NSString *)sha512Hash;


3.RSA 加密

// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;

// decrypt base64 encoded string, convert result to string(not base64 encoded)
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;


4. AES加密解密，以及生成随机秘钥（128位）
//AES128 加密 ECB模式 base64 key
+ (NSString *)AES:(NSString *)content RandomKey:(NSString *)key;


//AES128 解密 ECB模式 base64 key
+ (NSString *)AESDecrypt:(NSString *)content RandomKey:(NSString *)key;


//获得16位的随机数作为AES加密秘钥
+ (NSString *)getRandomKey;




