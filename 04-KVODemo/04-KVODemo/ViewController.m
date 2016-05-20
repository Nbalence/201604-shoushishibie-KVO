//
//  ViewController.m
//  04-KVODemo
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYmode.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ageLab;
@property (strong,nonatomic)QYmode *mode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.初始化mode
    _mode=[[QYmode alloc] init];
    _mode.name=@"张三";
    _mode.age=18;
    
    //2.添加属性观察者
    [_mode addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:(__bridge void *)_ageLab];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark observeValue  监听
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
   //1.判断keypath
    if ([keyPath isEqualToString:@"age"]) {
        //2.取出新值
        NSInteger age=[change[@"new"] integerValue];
        
        //3.更新ui
        UILabel *labe=(__bridge UILabel *)context;
        labe.text=[NSString stringWithFormat:@"岁数：%ld",age];
        
        /*
        _ageLab.text=[NSString stringWithFormat:@"岁数：%ld",age];
         */
    }
    


}


- (IBAction)AddAgeAction:(id)sender {
    //改变监听属性值
    _mode.age+=1;
}

-(void)dealloc{
    //移除观察者
    [_mode removeObserver:self forKeyPath:@"age"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
