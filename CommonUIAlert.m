//
//  CommonUIAlert.m
//  https://github.com/Ericfengshi/CommonUIAlert/blob/master/CommonUIAlert.m
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 fengs. All rights reserved.
//

#import "CommonUIAlert.h"
#import "UIAlertView+IABlocks.h"
#import "AlertController.h"

#define kCommonUIAlertTitle               @"温馨提示"
#define kCommonUIAlertDefaultButtonTitle  @"确定"

@interface CommonUIAlert()<UIAlertViewDelegate>
@end

@implementation CommonUIAlert

-(void)showCommonAlertViewTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle cancle:(void (^)())cancle confirm:(void (^)())confirm{
    if(!confirm){
        confirm = ^(){};
    }
    if (!cancle) {
        cancle = ^(){};
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        if (otherButtonTitle == nil && cancelButtonTitle == nil) {
            cancelButtonTitle = kCommonUIAlertDefaultButtonTitle;
            if (title == nil) {
                title = kCommonUIAlertTitle;
            }
        }
        AlertController *alertController = [AlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        if (otherButtonTitle) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                confirm();
            }];
            [alertController addAction:otherAction];
        }
        
        if (cancelButtonTitle) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                cancle();
            }];
            [alertController addAction:cancelAction];
        }
        
        [alertController show:YES completion:nil];
    }else{
        if (otherButtonTitle == nil && cancelButtonTitle == nil) {
            if (title == nil) {
                title = kCommonUIAlertTitle;
            }
            [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:kCommonUIAlertDefaultButtonTitle otherButtonTitles: nil] show];
        }else{
            if (cancelButtonTitle == nil || otherButtonTitle == nil) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                                message:message
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:otherButtonTitle?otherButtonTitle:cancelButtonTitle, nil];
                
                [alert setHandler:^(UIAlertView* alert, NSInteger buttonIndex) {
                    if(otherButtonTitle){
                        confirm();
                    }else{
                        cancle();
                    }
                } forButtonAtIndex:0];
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                                message:message
                                                      cancelButtonTitle:cancelButtonTitle
                                                      otherButtonTitles:otherButtonTitle, nil];
                [alert setHandler:^(UIAlertView* alert, NSInteger buttonIndex) {
                    confirm();
                } forButtonAtIndex:[alert firstOtherButtonIndex]];
                
                [alert setHandler:^(UIAlertView* alert, NSInteger buttonIndex) {
                    cancle();
                } forButtonAtIndex:0];
                [alert show];
            }
        }
    }
}

- (void)showCommonAlertViewMessage:(NSString *)message{
    [self showCommonAlertViewTitle:nil message:message cancelButtonTitle:nil otherButtonTitle:nil cancle:nil confirm:nil];
}

@end
