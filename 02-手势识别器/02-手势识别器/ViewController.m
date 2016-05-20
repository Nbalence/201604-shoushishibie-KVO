//
//  ViewController.m
//  02-手势识别器
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
 点击手势 (UITapGestureRecognizer)
 滑动手势 (UISwipeGestureRecognizer)
 旋转手势 (UIRotationGestureRecognizer)
 捏合手势 (UIPinchGestureRecognizer)
 长按手势 (UILongPressGestureRecognizer)
 平移手势 (UIPanGestureRecognizer) 
 屏幕边缘平移手势 (UIScreenEdgePanGestureRecognizer)
 **/


-(void)TapGestureRecor:(UITapGestureRecognizer*)recor{
    NSLog(@"单击手势");
}

-(void)DoubTapGestRecor:(UITapGestureRecognizer*)recor{
    NSLog(@"========双击");

}

-(void)swipeGestureAction:(UISwipeGestureRecognizer *)recor{
    NSLog(@"滑动了");
}

-(void)rotationGetureAction:(UIGestureRecognizer *)recor{
    NSLog(@"转动了");
}

-(void)pinchGestureRecognizer:(UIPinchGestureRecognizer*)recor{
    NSLog(@"捏合了");
}

-(void)LongPressAction:(UIGestureRecognizer *)recor{
//    if (recor.state) {
//        <#statements#>
//    }
    if (recor.state==UIGestureRecognizerStateBegan) {
        NSLog(@"=======长按了");

    }
    
    
}

-(void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture{
    NSLog(@"======移动了");
}

-(void)screenPanGesture:(UIScreenEdgePanGestureRecognizer *)gesture{

    NSLog(@"======边缘滑动");

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.添加单击手势
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapGestureRecor:)];
    [self.view addGestureRecognizer:tapGesture];
    
    //2.双击手势
    UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc] init];
    [doubleTap addTarget:self action:@selector(DoubTapGestRecor:)];
    //设置双击次数
    doubleTap.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:doubleTap];
    
    //是让两个手势建立起一个关联，其中一个手势启动，另一个要失效
    [tapGesture requireGestureRecognizerToFail:doubleTap];
  
    //3.滑动手势
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAction:)];
    swipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGesture];
    
    //4. 旋转手势
    UIRotationGestureRecognizer *rotationGesture=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGetureAction:)];
    [self.view addGestureRecognizer:rotationGesture];
    
   //捏合手势
    UIPinchGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognizer:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    //6.长按手势
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer
                                              alloc] initWithTarget:self action:@selector(LongPressAction:)];
    longPress.minimumPressDuration=1;
    [self.view addGestureRecognizer:longPress];
    
    //7.平移手势
//    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
//    [self.view addGestureRecognizer:panGesture];
  
    //屏幕边缘手势
    UIScreenEdgePanGestureRecognizer *degeScreen=[[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPanGesture:)];
    degeScreen.edges=UIRectEdgeLeft;
    [self.view addGestureRecognizer:degeScreen];
    
    UIScreenEdgePanGestureRecognizer *right=[[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPanGesture:)];
    right.edges=UIRectEdgeRight;
    [self.view addGestureRecognizer:right];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
