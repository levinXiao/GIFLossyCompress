# GIFLossyCompress

### How To Use


```
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

```
