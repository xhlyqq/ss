//
//  ViewController.m
//  FKVODemoed
//
//  Created by mac on 16/5/6.
//  Copyright © 2016年 R. All rights reserved.
//
//  K:key V:value O:observer 他是在kvc的基础上实现的

#import "ViewController.h"
#import "People.h"

@interface ViewController () {
    NSInteger       count;
}
@property (retain, nonatomic) People *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    count = 0;
    _p = [[People alloc] init];
    
//    添加一个观察者来观察这个对象的属性,第二个参数是你要观察的那个属性的名字
    [_p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}

- (IBAction)btnClick:(UIButton *)sender {
    count ++;
    [_p setValue:[NSNumber numberWithInteger:count] forKey:@"age"];
//    [_p setValue:@(count) forKey:@"age"];
    
}

//     观察者观察到属性发生变化时就会调用这个方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"*****%ld",count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
//    添加了一个观察者就要对他的内存进行管理
    [_p removeObserver:self forKeyPath:@"age"];
    [super dealloc];
}

@end
