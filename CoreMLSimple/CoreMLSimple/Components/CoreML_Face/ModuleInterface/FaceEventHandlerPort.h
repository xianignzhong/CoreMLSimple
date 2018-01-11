//
//  FaceEventHandlerPort.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@protocol FaceEventHandlerPort <NSObject>

@property (nonatomic, strong)RACCommand *ageCommand;
@property (nonatomic, strong)RACCommand *genderCommand;
@property (nonatomic, strong)RACCommand *emotionCommand;

@property (nonatomic, strong)UIImage * faceImage;

//结果
@property (nonatomic, copy)NSString * age;
@property (nonatomic, strong)NSString * agePer;
@property (nonatomic, copy)NSString * gender;
@property (nonatomic, strong)NSNumber * genderPer;
@property (nonatomic, copy)NSString * emotion;
@property (nonatomic, strong)NSNumber * emotionPer;

@end
