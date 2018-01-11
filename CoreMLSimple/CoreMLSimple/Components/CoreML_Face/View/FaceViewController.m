//
//  FaceViewController.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "FaceViewController.h"
#import "FaceViewModel.h"
#import "FaceEventHandlerPort.h"

@interface FaceViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *header;

@property (weak, nonatomic) IBOutlet UIButton *btn;


@property (weak, nonatomic) IBOutlet UILabel *ageLB;
@property (weak, nonatomic) IBOutlet UILabel *agePer;
@property (weak, nonatomic) IBOutlet UILabel *genderLB;
@property (weak, nonatomic) IBOutlet UILabel *genderPer;
@property (weak, nonatomic) IBOutlet UILabel *emotionLB;
@property (weak, nonatomic) IBOutlet UILabel *emotionPer;
@end

@implementation FaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeViewModel:[FaceViewModel class]];
    
    [self aoe_setupBindData];
}

-(void)aoe_setupBindData{
    
    id<FaceEventHandlerPort> eventHandler = AMKConvertViewModelToType(id<FaceEventHandlerPort>);
    
    RAC(eventHandler, faceImage) = RACObserve(self.header, image);
    
    RAC(self.ageLB, text) = RACObserve(eventHandler, age);
    RAC(self.genderLB, text) = RACObserve(eventHandler, gender);
    RAC(self.emotionLB, text) = RACObserve(eventHandler, emotion);
    
    AMK_Weakify
    [RACObserve(eventHandler, agePer) subscribeNext:^(id  _Nullable x) {
        
        AMK_Strongify
        if (x!=0) {
            
            self.agePer.text = [NSString stringWithFormat:@"匹配度--%@",[x stringValue]];
        }
        
    }];
    
    [RACObserve(eventHandler, genderPer) subscribeNext:^(id  _Nullable x) {
        
        AMK_Strongify
        if (x!=0) {
            
            self.genderPer.text = [NSString stringWithFormat:@"匹配度--%@",[x stringValue]];
        }
        
    }];
    
    [RACObserve(eventHandler, emotionPer) subscribeNext:^(id  _Nullable x) {
        
        AMK_Strongify
        if (x!=0) {
            
            self.emotionPer.text = [NSString stringWithFormat:@"匹配度--%@",[x stringValue]];
        }
        
    }];
    
}

- (IBAction)jiexi:(id)sender {
    
    id<FaceEventHandlerPort> eventHandler = AMKConvertViewModelToType(id<FaceEventHandlerPort>);
    
    [eventHandler.ageCommand execute:nil];
    [eventHandler.genderCommand execute:nil];
    [eventHandler.emotionCommand execute:nil];
    
}



- (IBAction)ChangeImg:(id)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    //显示消息框
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSUInteger sourceType = 0;
    // 判断系统是否支持相机
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerController.delegate = self; //设置代理
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType; //图片来源
        if (buttonIndex == 0) {
            return;
        }else if (buttonIndex == 1) {
            //拍照
            sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.sourceType = sourceType;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }else if (buttonIndex == 2){
            //相册
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickerController.sourceType = sourceType;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
    }else {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerController.sourceType = sourceType;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage]; //通过key值获取到图片
    
    self.header.image = image;
    self.ageLB.text = @"";
    self.agePer.text = @"";
    self.genderLB.text = @"";
    self.genderPer.text = @"";
    self.emotionLB.text = @"";
    self.emotionPer.text = @"";
}

//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
