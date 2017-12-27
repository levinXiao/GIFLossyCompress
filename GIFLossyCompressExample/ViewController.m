//
//  ViewController.m
//  GIFCompressExample
//
//  Created by xiaoyu on 2017/12/18.
//  Copyright © 2017年 lenovo. All rights reserved.
//

#import "ViewController.h"

#import "GIFCompression.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *input = [[NSBundle mainBundle] pathForResource:@"meme" ofType:@"gif"];
    
    NSString *dirtail = [NSString stringWithFormat:@"%@",@"/Documents/Images"];
    NSString *dirfull = [NSHomeDirectory() stringByAppendingPathComponent:dirtail];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dirfull]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dirfull withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *outpath = [[dirfull stringByAppendingPathComponent:@"meme2"] stringByAppendingPathExtension:@"gif"];
    
    NSLog(@"out path :%@",outpath);
    
    GIFCompressionResult re = [GIFCompression compressGIFWithLossyLevel:80 inputPath:input outputPath:outpath];
    NSLog(@"end result : %d",(long)re);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

