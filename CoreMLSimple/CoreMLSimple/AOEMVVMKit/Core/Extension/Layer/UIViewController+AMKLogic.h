//
//  UIViewController+AMKLogic.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMKEventHandlerPort.h"

#define AMKConvertViewModelToType(type) AMKRealPort(type, self.logicHandler)

@interface UIViewController (AMKLogic)

/**
 *  事件处理层 (Runtime解决Category添加属性)
 */
@property (nonatomic, strong, readonly) __kindof id<AMKEventHandlerPort> logicHandler;

/**
 初始化业逻辑层
 
 @param viewModelClass 业务逻辑Class
 */
-(void)initializeViewModel:(Class)viewModelClass;

@end
