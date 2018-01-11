//
//  FaceViewModel.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AMKViewModel.h"
#import <ReactiveObjC.h>

@interface FaceViewModel : AMKViewModel

@property (nonatomic, strong)RACCommand *ageCommand;
@property (nonatomic, strong)RACCommand *genderCommand;
@property (nonatomic, strong)RACCommand *emotionCommand;

@property (nonatomic, strong)UIImage * faceImage;

//结果
@property (nonatomic, copy)NSString * age;
@property (nonatomic, copy)NSNumber * agePer;
@property (nonatomic, copy)NSString * gender;
@property (nonatomic, copy)NSNumber * genderPer;
@property (nonatomic, copy)NSString * emotion;
@property (nonatomic, copy)NSNumber * emotionPer;

@end
