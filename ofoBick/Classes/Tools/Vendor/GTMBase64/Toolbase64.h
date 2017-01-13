//
//  base64.h
//  Dutyfree
//
//  Created by wade on 15/8/3.
//  Copyright (c) 2015年 Fow Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

extern size_t EstimateBas64EncodedDataSize(size_t inDataSize);
extern size_t EstimateBas64DecodedDataSize(size_t inDataSize);

extern bool Base64EncodeData(const void *inInputData, size_t inInputDataSize, char *outOutputData, size_t *ioOutputDataSize, BOOL wrapped);
extern bool Base64DecodeData(const void *inInputData, size_t inInputDataSize, void *ioOutputData, size_t *ioOutputDataSize);


