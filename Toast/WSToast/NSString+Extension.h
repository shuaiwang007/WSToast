//
//  NSString+Extension.h
//  Toast
//
//  Created by 王帅 on 16/3/16.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

@property (nonatomic, readonly) NSString *				MD5;
@property (nonatomic, readonly) NSData *				MD5Data;

+(NSString *) uuid;

- (BOOL)empty;
- (BOOL)notEmpty;

- (BOOL)isTelephone;
- (BOOL)isEmail;
- (BOOL)isUrl;
//车牌号
- (BOOL)isCarNo;

/**
 *  将小数4舍5入
 *
 *  @param position 保留小数的位数
 *
 *  @return 4舍5入结果
 */
-(NSString *)roundUpAfterPoint:(int)position;

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
- (CGSize)sizeWithFont:(UIFont *)font byWidth:(CGFloat)width;
- (CGSize)sizeWithFont:(UIFont *)font byHeight:(CGFloat)height;
- (CGFloat)widthWithFont:(UIFont *)font byHeight:(CGFloat)height;
- (CGFloat)heightWithFont:(UIFont *)font byWidth:(CGFloat)width;

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)


/**
 *  去除空白和换行符号
 */
- (NSString *)trim;

- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
@end
