//
//  AMKViewModel.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AMKViewModel.h"

@implementation AMKViewModel

-(id)init{
    
    self = [super init];
    
    if (self) {
        
        [self vm_viewDidLoad];
        [self initCommand];
    }
    
    return self;
}

#pragma mark - 生命周期
- (void)vm_viewDidLoad{}
- (void)initCommand{}
- (void)vm_viewWillAppear{}
- (void)vm_viewDidAppear{}
- (void)vm_viewWillDisappear{}
- (void)vm_viewDidDisappear{}

@end
