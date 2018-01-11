//
//  CoreMLAgent.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface CoreMLAgent : NSObject

+(RACSignal *)faceToAgeInformationCoreMLWithImage:(UIImage *)image;

+(RACSignal *)faceToGenderInformationCoreMLWithImage:(UIImage *)image;

+(RACSignal *)faceToEmotionsInformationCoreMLWithImage:(UIImage *)image;

@end
