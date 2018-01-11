//
//  CoreMLAgent.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "CoreMLAgent.h"
#import "AgeNet.h"
#import "GenderNet.h"
#import "CNNEmotions.h"

#import <CoreML/CoreML.h>
#import <Vision/Vision.h>

@implementation CoreMLAgent

+(RACSignal *)faceToAgeInformationCoreMLWithImage:(UIImage *)image{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        AgeNet *ageNetModel = [[AgeNet alloc]init];
        VNCoreMLModel * vnCoreModel = [VNCoreMLModel modelForMLModel:ageNetModel.model error:nil];
        VNCoreMLRequest * vnCoreRequest = [[VNCoreMLRequest alloc]initWithModel:vnCoreModel completionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
            
            CGFloat confidence = 0.0f;
            
            for (VNClassificationObservation *classification in request.results) {
                
                if (classification.confidence > confidence) {
                    
                    confidence = classification.confidence;
                    
                    [subscriber sendNext:RACTuplePack(classification)];
                    [subscriber sendCompleted];
                }
            }
        }];
        
        VNImageRequestHandler * vnImageRequestHandler = [[VNImageRequestHandler alloc]initWithCGImage:image.CGImage options:@{}];
        [vnImageRequestHandler performRequests:@[vnCoreRequest] error:nil];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

+(RACSignal *)faceToGenderInformationCoreMLWithImage:(UIImage *)image{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        GenderNet *ageNetModel = [[GenderNet alloc]init];
        VNCoreMLModel * vnCoreModel = [VNCoreMLModel modelForMLModel:ageNetModel.model error:nil];
        VNCoreMLRequest * vnCoreRequest = [[VNCoreMLRequest alloc]initWithModel:vnCoreModel completionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
            
            CGFloat confidence = 0.0f;
            
            for (VNClassificationObservation *classification in request.results) {
                
                if (classification.confidence > confidence) {
                    
                    confidence = classification.confidence;
                    
                    [subscriber sendNext:RACTuplePack(classification)];
                    [subscriber sendCompleted];
                }
            }
        }];
        
        VNImageRequestHandler * vnImageRequestHandler = [[VNImageRequestHandler alloc]initWithCGImage:image.CGImage options:@{}];
        [vnImageRequestHandler performRequests:@[vnCoreRequest] error:nil];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

+(RACSignal *)faceToEmotionsInformationCoreMLWithImage:(UIImage *)image{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        CNNEmotions *ageNetModel = [[CNNEmotions alloc]init];
        VNCoreMLModel * vnCoreModel = [VNCoreMLModel modelForMLModel:ageNetModel.model error:nil];
        VNCoreMLRequest * vnCoreRequest = [[VNCoreMLRequest alloc]initWithModel:vnCoreModel completionHandler:^(VNRequest * _Nonnull request, NSError * _Nullable error) {
            
            CGFloat confidence = 0.0f;
            
            for (VNClassificationObservation *classification in request.results) {
                
                if (classification.confidence > confidence) {
                    
                    confidence = classification.confidence;
                    
                    [subscriber sendNext:RACTuplePack(classification)];
                    [subscriber sendCompleted];
                }
            }
        }];
        
        VNImageRequestHandler * vnImageRequestHandler = [[VNImageRequestHandler alloc]initWithCGImage:image.CGImage options:@{}];
        [vnImageRequestHandler performRequests:@[vnCoreRequest] error:nil];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

@end
