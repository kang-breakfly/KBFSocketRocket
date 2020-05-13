//
//  SocketManager.m
//  JieDu
//
//  Created by Apple on 2020/5/11.
//  Copyright © 2020 Apple. All rights reserved.
//
//------made in china-------
/**   The code comes frome breakfly
 *
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　━　　　┃
 * 　　┃ 　^      ^ 　┃
 * 　　┃　　　┻　　　┃
 * 　　┗━━━━━━━┛
 *
 * --------萌萌哒-------
 */
#import "SocketManager.h"
#import <UIKit/UIKit.h>
//#import "NetNotification.h"
static SocketManager *_instance = nil;
static dispatch_once_t onceToken;
@implementation SocketManager
+(instancetype)shareSocketManager{
    if (!_instance) {
         dispatch_once(&onceToken, ^{
             if (!_instance) {
                 _instance=[[SocketManager alloc]init];
             }
         });
     }
    return _instance;
}
-(id)init{
    self=[super init];
    if (self) {
        self.maxConnectNum = 3;
       // [self connect];
       /* [[NetNotification shareNetNotification] isCanConnectenToNetworkComplation:^(NSInteger isCan) {
            if (isCan) {
                 [self connect];
            }
            
            NSLog(@"======  %@",@(isCan));
            
        }];*/
    }
    return self;
}
-(void)connect{
    [self cutOffSocket];
    self.webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"wss://www.yiwangzhidu.cn/socket.io"]];
    self.webSocket.delegate=self;
    [self.webSocket open];
}
-(void)closeHeartbeat{
    [self.connectTimer invalidate];
}


-(void)cutOffSocket{
    //self.webSocket.delegate=nil;
    [self closeHeartbeat];
    [self.webSocket close];
}
-(void)startHeartbeat{
    self.connectTimer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(sendPing) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.connectTimer forMode:UITrackingRunLoopMode];
}

- (void)sendPing{
     NSLog(@"sendPing");
    [self.webSocket sendPing:nil error:NULL];
}
#pragma mark - SRWebSocketDelegate
-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
     NSLog(@"Websocket Connected");
    //链接成功 启动心跳包
    [self startHeartbeat];
    self.currentConnectNum=0;
}
-(void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
    //断网的状态的下 或者网络出问题的情况下断开心跳包
    [self closeHeartbeat];
    if ( self.currentConnectNum<=self.maxConnectNum) {
        [self connect];
    }
    NSLog(@":( Websocket Failed With Error %@", error);
}
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessageWithString:(nonnull NSString *)string{
    //收到后台返回 的消息
      NSLog(@"Websocket ReceiveMessage:   %@",string);
}
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
      [self closeHeartbeat];
    self.currentConnectNum ++;
    //判断是否是手动断开，在判断是否在允许重连的范围内
    if (!wasClean && self.currentConnectNum<=self.maxConnectNum) {
        [self connect];
    }
    NSLog(@"WebSocket closed    code: %@  reason:%@ wasClean:%@",@(code),reason,@(wasClean));
}
- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload{
    NSLog(@"WebSocket received pong");
}
@end
