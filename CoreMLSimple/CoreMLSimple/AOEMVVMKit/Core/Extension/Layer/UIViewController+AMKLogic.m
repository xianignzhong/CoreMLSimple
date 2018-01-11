//
//  UIViewController+AMKLogic.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "UIViewController+AMKLogic.h"
#import <objc/runtime.h>

@implementation UIViewController (AMKLogic)

//初始化方法
-(void)initializeViewModel:(Class)viewModelClass{
    
    //构建业务逻辑层
    id viewModel;
    if (viewModelClass) {
        
        viewModel = [[viewModelClass alloc]init];
        [self setValue:viewModel forKey:@"logicHandler"];
    }
}

-(void)setLogicHandler:(__kindof id<AMKEventHandlerPort>)logicHandler{
    
    objc_setAssociatedObject(self, @selector(logicHandler), logicHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id<AMKEventHandlerPort>)logicHandler{
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
