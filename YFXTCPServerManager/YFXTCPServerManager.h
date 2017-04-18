//
//  YFXTCPServerManager.h
//  YFXTCPServerManager
//
//  Created by fangxue on 2017/4/18.
//  Copyright © 2017年 fangxue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFXTCPServerManager : NSObject

+ (instancetype)share;

//等待连接
- (BOOL)accept;

//发送数据
- (void)sendDataTOClient:(NSData *)data;

@end
