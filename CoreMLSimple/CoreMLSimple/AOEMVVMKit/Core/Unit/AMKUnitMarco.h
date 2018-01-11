//
//  AMKUnitMarco.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#ifndef AMKUnitMarco_h
#define AMKUnitMarco_h

/**
 转到新的子接口类型或子对象
 */
#define AMKRealPort(nowPort, oldPort) ((nowPort)(oldPort))

//弱引用
#pragma clang diagnostic ignored "-Wunused-variable"
#define AMK_Weakify \
__weak __typeof__ (self) self_weak_ = self;
#define AMK_Strongify \
__strong __typeof__(self) self = self_weak_;

/*
 基于ReactiveCocoa的命令绑定
 */
#define AMK_C_(UIButton,EventHandler,Command) UIButton.rac_command = [EventHandler Command];

/**
 基于ReactiveCocoa的快速命令执行宏
 */
#define AMK_CEXE_Begin AMK_Weakify

/*
 绑定命令与执行代码（默认返回空信号，可以手动返回新信号）
 */
#define AMK_CEXE_(commandRef, ExecuteCode) \
commandRef = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) { \
AMK_Weakify \
[self self]; \
ExecuteCode \
return [RACSignal empty]; \
}]; \

/*
 基于enable信号，绑定命令与执行代码（默认返回空信号，可手动返回新的信号）
 */
#define AMK_CEXE_Enable_(commandRef, enableSignal, ExecuteCode)\
commandRef = [[RACCommand alloc] initWithEnabled:enableSignal signalBlock:^RACSignal *(id input) {\
AMK_Strongify \
[self self]; \
ExecuteCode \
return [RACSignal empty]; \
}];

#endif /* AMKUnitMarco_h */
