//
//  SocketManager.h
//  JieDu
//
//  Created by Apple on 2020/5/11.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketRocket.h"
NS_ASSUME_NONNULL_BEGIN

@interface SocketManager : NSObject<SRWebSocketDelegate>
+(instancetype)shareSocketManager;
@property(nonatomic,strong)SRWebSocket *webSocket;
/** 心跳包定时 默认30s */
@property(nonatomic,strong)NSTimer *connectTimer;
/** 最大重连次数 */
@property(nonatomic,assign)NSInteger maxConnectNum;
/** 当前重连次数 */
@property(nonatomic,assign)NSInteger currentConnectNum;

/** 启动心跳包 */
-(void)startHeartbeat;
/** 链接 */
-(void)connect;
/** 断开链接 */
-(void)cutOffSocket;
@end

NS_ASSUME_NONNULL_END
