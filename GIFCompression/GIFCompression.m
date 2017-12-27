//
//  GIFCompression.m
//  GIFCompression
//
//  Created by xiaoyu on 2017/12/19.
//  Copyright © 2017年 lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GIFCompression.h"

#include "gif_compress.h"

@implementation GIFCompression

+ (GIFCompressionResult)compressGIFWithLossyLevel:(int)lossylevel inputPath:(NSString *)inputPath outputPath:(NSString *)outputPath {
    if (!inputPath || [inputPath isEqualToString:@""]) {
        return GIFCompressionResultErrorNotInputNameError;
    }
    
    if (!outputPath || [outputPath isEqualToString:@""]) {
        return GIFCompressionResultErrorNotOutputNameError;
    }
    
    inputPath = [inputPath stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExistInput = [fileManager fileExistsAtPath:inputPath];
    if (!isExistInput) {
        return GIFCompressionResultErrorNotFoundInput;
    }
    
    NSData *inputData = [[NSData alloc] initWithContentsOfFile:inputPath];
    uint8_t c;
    [inputData getBytes:&c length:1];
    if (c != 0x47) {
        return GIFCompressionResultErrorInputNotGIF;
    }
    
    BOOL isExistOutput = [fileManager fileExistsAtPath:outputPath];
    if (isExistOutput) {
        [fileManager removeItemAtPath:outputPath error:nil];
    }
    
    char *inputChar = (char *)(inputPath.UTF8String);
    char *outputChar = (char *)(outputPath.UTF8String);
    
    int result = gif_compress(lossylevel, inputChar, outputChar);
    if (result == 0) {
        return GIFCompressionResultOK;
    }
    return GIFCompressionResultErrorCompress;
}

@end
