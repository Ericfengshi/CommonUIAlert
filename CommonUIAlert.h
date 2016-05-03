//
//  CommonUIAlert.h
//  https://github.com/Ericfengshi/CommonUIAlert/blob/master/CommonUIAlert.m
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 fengs. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CommonUIAlert : UIViewController

-(void)showCommonAlertViewTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle cancle:(void (^)())cancle confirm:(void (^)())confirm;

- (void)showCommonAlertViewMessage:(NSString *)message;

@end