//
//  FaceViewModel.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "FaceViewModel.h"
#import "CoreMLAgent.h"

#import <Vision/Vision.h>

@implementation FaceViewModel

-(void)initCommand{
    
    AMK_CEXE_Begin

    AMK_CEXE_(self.ageCommand, {
        
        return [[[CoreMLAgent faceToAgeInformationCoreMLWithImage:self.faceImage] doNext:^(id  _Nullable x) {
            
            RACTuple * tuple = (RACTuple *)x;
            VNClassificationObservation * obj = tuple.first;
            self.age = obj.identifier;
            self.agePer = @(obj.confidence);
            
        }] doError:^(NSError * _Nonnull error) {
            
        }];
    })
    
    AMK_CEXE_(self.genderCommand, {
        
        return [[[CoreMLAgent faceToGenderInformationCoreMLWithImage:self.faceImage] doNext:^(id  _Nullable x) {
            
            RACTuple * tuple = (RACTuple *)x;
            VNClassificationObservation * obj = tuple.first;
            self.gender = obj.identifier;
            self.genderPer = @(obj.confidence);
            
        }] doError:^(NSError * _Nonnull error) {
            
        }];
    })
    
    AMK_CEXE_(self.emotionCommand, {
        
        return [[[CoreMLAgent faceToEmotionsInformationCoreMLWithImage:self.faceImage] doNext:^(id  _Nullable x) {
            
            RACTuple * tuple = (RACTuple *)x;
            VNClassificationObservation * obj = tuple.first;
            self.emotion = obj.identifier;
            self.emotionPer = @(obj.confidence);
            
        }] doError:^(NSError * _Nonnull error) {
            
        }];
    })
}


@end
