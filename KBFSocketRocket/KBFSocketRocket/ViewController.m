//
//  ViewController.m
//  KBFSocketRocket
//
//  Created by Apple on 2020/5/12.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SocketManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [SocketManager shareSocketManager];
        
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeClose];
        button.frame = CGRectMake(100, 100, 30, 30);
        [self.view addSubview:button];
        [button addTarget:self action:@selector(CutStream) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *conbutton = [UIButton buttonWithType:UIButtonTypeContactAdd];
         conbutton.frame = CGRectMake(100, 200, 30, 30);
         [self.view addSubview:conbutton];
         [conbutton addTarget:self action:@selector(conbutton) forControlEvents:UIControlEventTouchUpInside];
        
}
    -(void)CutStream{
        [[SocketManager shareSocketManager] cutOffSocket];
    }
    -(void)conbutton{
        [[SocketManager shareSocketManager] connect];
    }


@end
