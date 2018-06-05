//
//  ITEncryption.h
//  conductor
//
//  Created by pengchengwu on 2016/10/26.
//  Copyright © 2016年 intretech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITEncryption : NSObject

//MD2.MD4.MD5
//SHA1.SHA224.SHA256.SHA384.SHA512
//AES128.AES.DES.3DES.CAST.RC4.RC2.Blowfish

/**
 获取文件的MD5

 @param path 文件路径
 @return 文件MD5
 */
+ (NSString*)fetchFileMD5WithPath:(NSString*)path;
/**
 普通字符串转32字节小写MD5字符串

 @param srcString 普通字符串
 @return MD5字符串
 */
+ (NSString *)fetchMD5String:(NSString *)srcString;
+ (NSString *)fetchBase64StringWithString:(NSString *)srcString;
+ (NSString *)fetchStringWithBase64String:(NSString *)srcString;
+ (NSData *)fetchBase64DataWithString:(NSString *)string;
/**
 将源数据进行base64编码

 @param data 源数据
 @return base64编码的字符串
 */
+ (NSString *)fetchBase64StringWithData:(NSData *)data;
/**
 PB数据用key做AES128加密

 @param scrData PB数据
 @param key 密钥
 @return 加密数据
 */
+ (NSData *)fetchAESEncryptedData:(NSData *)scrData key:(char *)key;
/**
 加密数据用key做AES128解密

 @param scrData 加密数据
 @param key 密钥
 @return PB数据
 */
+ (NSData *)fetchAESDecryptedData:(NSData *)scrData key:(char *)key;
/**
 普通字符串用服务器公钥做RSA加密

 @param srcStr 普通字符串
 @param pubKey 服务器公钥
 @return 加密字符串
 */
+ (NSString *)fetchRSAEncryptString:(NSString *)srcStr publicKey:(NSString *)pubKey;
/**
 普通数据用服务器公钥做RSA加密

 @param srcData 普通数据
 @param pubKey 服务器公钥
 @return 加密数据
 */
+ (NSData *)fetchRSAEncryptData:(NSData *)srcData publicKey:(NSString *)pubKey;
/**
 加密字符串用本地私钥做RSA解密

 @param srcStr 加密字符串
 @param privKey 本地私钥
 @return 普通字符串
 */
+ (NSString *)fetchRSADecryptString:(NSString *)srcStr privateKey:(NSString *)privKey;
/**
 加密数据用本地私钥做RSA解密

 @param srcData 加密数据
 @param privKey 本地私钥
 @return 普通数据
 */
+ (NSData *)fetchRSADecryptData:(NSData *)srcData privateKey:(NSString *)privKey;

@end
