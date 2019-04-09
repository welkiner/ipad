//
//  NSString+HETAdditions.h
//  HETSDK
//
//  Created by JiangJun on 15/3/31.
//  Copyright (c) 2015年 JiangJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)


+ (BOOL)isContainsEmoji:(NSString *)string;//检查时候包含emoji

+ (NSString *)removeEmojiString:(NSString *)string;//去除emoji
@end
