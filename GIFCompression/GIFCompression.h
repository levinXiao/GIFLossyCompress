//
//  GIFCompression.h
//  GIFCompression
//
//  Created by xiaoyu on 2017/12/18.
//  Copyright © 2017年 lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GIFCompressionResult) {
    GIFCompressionResultOK                      = 0,//无错误
    GIFCompressionResultErrorNotInputNameError  = 1,//inputpath格式错误（nil或空字符）
    GIFCompressionResultErrorNotOutputNameError = 2,//outputpath格式错误（nil或空字符）
    GIFCompressionResultErrorNotFoundInput      = 3,//没有找到inputpath
    GIFCompressionResultErrorInputNotGIF        = 4,//inputpath文件不是gif文件
    GIFCompressionResultErrorCompress           = 5,//压缩出问题
};

@interface GIFCompression : NSObject

+ (GIFCompressionResult)compressGIFWithLossyLevel:(int)lossylevel inputPath:(NSString *)inputPath outputPath:(NSString *)outputPath;

@end
