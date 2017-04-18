//
//  ViewController.m
//  YFXTCPServerManager
//
//  Created by fangxue on 2017/4/18.
//  Copyright © 2017年 fangxue. All rights reserved.
//

#import "ViewController.h"
#import "YFXTCPServerManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //等待客户端连接
    [[YFXTCPServerManager share]accept];
    
    //发送数据
    
    [[YFXTCPServerManager share]sendDataTOClient:[@"我是服务端" dataUsingEncoding:NSUTF8StringEncoding]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
