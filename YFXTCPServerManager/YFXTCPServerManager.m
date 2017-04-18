//
//  YFXTCPServerManager.m
//  YFXTCPServerManager
//
//  Created by fangxue on 2017/4/18.
//  Copyright © 2017年 fangxue. All rights reserved.
//

#import "YFXTCPServerManager.h"
#import "GCDAsyncSocket.h"

@interface YFXTCPServerManager ()<GCDAsyncSocketDelegate>
{
    
    GCDAsyncSocket *gcdSocket;
}
@end

@implementation YFXTCPServerManager

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static YFXTCPServerManager *manager = nil;
    dispatch_once(&onceToken, ^{
         manager = [[self alloc]init];
        [manager setupSocket];
    });
    return manager;
}
- (void)setupSocket
{
    gcdSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
}
//等待连接
- (BOOL)accept
{
    return [gcdSocket acceptOnPort:8000 error:nil];
}
//发送数据
- (void)sendDataTOClient:(NSData *)data{
    
    [gcdSocket writeData:data withTimeout:-1 tag:0];
}
#pragma mark TCP代理
//接受到客户端时调用
- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket
{
    NSLog(@"接收到新的客户端");
    
    gcdSocket = newSocket;
    
    [newSocket readDataToData:[GCDAsyncSocket CRLFData] withTimeout:-1 tag:0];
}
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    [sock readDataToData:[GCDAsyncSocket CRLFData] withTimeout:-1 tag:0];
}
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(nullable NSError *)err{
    
    [self accept];
}



@end
