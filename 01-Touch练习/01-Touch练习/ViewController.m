//
//  ViewController.m
//  01-Touch练习
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cyanSquareView;
@property (weak, nonatomic) IBOutlet UIImageView *magentaView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowView;

@property (nonatomic)CGRect cRect;
@property (nonatomic)CGRect mRect;
@property (nonatomic)CGRect yRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cRect=_cyanSquareView.frame;
    _mRect=_magentaView.frame;
    _yRect=_yellowView.frame;
    
    // Do any additional setup after loading the view, typically from a nib.
}
//判断点是否在三个图形的任意一个区域内
-(BOOL)isImageViewContainsPoint:(CGPoint )point{
    if (CGRectContainsPoint(_cyanSquareView.frame, point)||CGRectContainsPoint(_magentaView.frame, point)||CGRectContainsPoint(_yellowView.frame, point)) {
      
        return YES;
    }
    return NO;
}
//还原视图
-(void)resetFrame{
[UIView animateWithDuration:.5 animations:^{
    
    _cyanSquareView.frame=_cRect;
    _magentaView.frame=_mRect;
    _yellowView.frame=_yRect;
}];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.获取一个点
    UITouch *touch =[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    //2判断点是否在矩形区域内
    if([self isImageViewContainsPoint:point]){
      //放大功能
       //2.1获取当前视图
        UIImageView *imageView=(UIImageView *)touch.view;
        [UIView animateWithDuration:.3 animations:^{
            imageView.transform=CGAffineTransformMakeScale(1.2, 1.2);
//            imageView.center=point;
        }];
    }
    
    //双击还原位置
    if(touch.tapCount==2){
        [self resetFrame];
    }
}

-(void)moveImageViewFromPoint:(CGPoint)point{
    if (CGRectContainsPoint(_yellowView.frame, point)) {
        [UIView animateWithDuration:.3 animations:^{
            _yellowView.center=point;
        }];
    }
    if (CGRectContainsPoint(_cyanSquareView.frame, point)) {
        [UIView animateWithDuration:.3 animations:^{
            _cyanSquareView.center=point;
        }];
    }
    if (CGRectContainsPoint(_magentaView.frame, point)) {
        [UIView animateWithDuration:.3 animations:^{
            _magentaView.center=point;
        }];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     //1.获取当前的点
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    
    //2.判断点是否在矩形区域内，中心点移动
    [self moveImageViewFromPoint:point];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  //获取当前视图
    UITouch *touch=[touches anyObject];
    
    UIImageView *imageView=(UIImageView *)touch.view;
    
    [UIView animateWithDuration:.3 animations:^{
       imageView.transform=CGAffineTransformIdentity
        ;
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
