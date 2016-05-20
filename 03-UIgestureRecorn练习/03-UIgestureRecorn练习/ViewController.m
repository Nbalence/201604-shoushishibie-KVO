//
//  ViewController.m
//  03-UIgestureRecorn练习
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIImageView *tempView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)resetFrame{
   //复原操作
[UIView animateWithDuration:.3 animations:^{
    _tempView.transform=CGAffineTransformIdentity;
    
}];
    
    
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

#pragma mark longpress
- (IBAction)LongPressRecognizer:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state==UIGestureRecognizerStateBegan) {

    //显示菜单
     //1.创建MenuItem对象
    UIMenuItem *menuItem=[[UIMenuItem alloc] initWithTitle:@"RestFrme" action:@selector(resetFrame)];
    //2.UIMenuController 对象
    UIMenuController *menuController=[UIMenuController sharedMenuController];
    //3设置要显示的菜单项
    menuController.menuItems=@[menuItem];
    //4设置大小显示区域
        
    CGPoint point=[sender locationInView:sender.view];
    [sender.view becomeFirstResponder];
        
        
    [menuController setTargetRect:CGRectMake(point.x, point.y, 0, 0) inView:sender.view];
    //5.显示出来
    [menuController setMenuVisible:YES animated:YES];
       //中间变量
    _tempView=sender.view;
        
    
    }
}

#pragma mark 旋转手势
- (IBAction)rotaionGestureRecognizer:(UIRotationGestureRecognizer *)sender {
    //1.获取旋转视图
    UIImageView *imageView=(UIImageView *)sender.view;
    //2.获取角度
    CGFloat angel=sender.rotation;
    NSLog(@"========%f",angel);
    //3.tranform 旋转角度
    imageView.transform=CGAffineTransformRotate(imageView.transform, angel);
    //4.设置rotation 为增量值
    sender.rotation=0;
    
}

#pragma mark 捏合放大缩小
- (IBAction)pinchGestureRecognizer:(UIPinchGestureRecognizer *)sender {
    //.获取当前视图
    UIImageView *touchView=(UIImageView *)sender.view;
    
    //2.获取当前scale
    CGFloat scale=sender.scale;
    NSLog(@"=====%f",scale);
    
    //3.改变transform
    touchView.transform=CGAffineTransformScale(touchView.transform, scale, scale);
    
    //4.scale 绝对值，需要每次值1
    sender.scale=1;
    
}

#pragma mark 平移
- (IBAction)panGestureRecognic:(UIPanGestureRecognizer *)sender {
   //1.获取视图
    UIImageView *ImageView=(UIImageView *)sender.view;
   //2.获取移动的点当前坐标
    CGPoint point=[sender translationInView:ImageView.superview];
    NSLog(@"==========%@",NSStringFromCGPoint(point));
   [sender setTranslation:CGPointZero inView:ImageView.superview];
 
   //3.视图中心点赋值
    
    ImageView.center=CGPointMake(ImageView.center.x+point.x, ImageView.center.y+point.y);
}

//协议处理多个手势之间的互斥，返回yes 可以同时使用两个手势
#pragma mark UIgesture delegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
