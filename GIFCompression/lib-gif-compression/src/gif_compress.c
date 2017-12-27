//
//  gif_compress.c
//  GIFCompression
//
//  Created by xiaoyu on 2017/12/19.
//  Copyright © 2017年 lenovo. All rights reserved.
//

#include "gifsicle.h"

int gif_compress(int lossylevel, char* inpath, char* outpath) {
    //    arg gifsicle
    //    arg -O3
    //    arg --lossy=80
    //    arg -o
    //    arg /Users/xiaoyu/Desktop/lossy-compressed.gif
    //    arg /Users/xiaoyu/Desktop/meme.gif
    
    if (inpath == NULL) {
        printf("inputpath  NULL \n");
        return -1;
    }else{
        printf("inputpath  %s \n",inpath);
    }
    
    if (outpath == NULL) {
        printf("outpath  NULL \n");
        return -1;
    }else{
        printf("outpath  %s \n",outpath);
    }
    
    if (lossylevel < 0 || lossylevel > 200) {
        lossylevel = 80;
    }
    char lossylevelchar[25];
    sprintf(lossylevelchar, "--lossy=%d", lossylevel);
    
    char* cmd[6];
    cmd[0] = "gifsicle";
    cmd[1] = "-O3";
    cmd[2] = lossylevelchar;
    cmd[3] = "-o";
    cmd[4] = outpath;
    cmd[5] = inpath;
    
    int result = oc_main(6, cmd);
    
    return result;
}
