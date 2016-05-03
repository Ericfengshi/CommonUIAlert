CommonUIAlert
===========
3rd：  
 		[AlertController](https://github.com/dbettermann/AlertController) ([Push AlertController to the topmost visible window](http://stackoverflow.com/questions/26554894/how-to-present-uialertcontroller-when-not-in-a-view-controller))  
 		[UIAlertView+IABlocks](https://github.com/Innovattic/UIKit-Blocks) ([Custom UIAlertView with block callback,avoid UIAlertview delegate crash] (http://stackoverflow.com/questions/14063389/custom-uialertview-with-block-callback))  
Ref：  
 		[实现对UIAlertController和UIAlertView判断系统后的简单封装](http://blog.csdn.net/july_sal/article/details/42006235?utm_source=tuicool&utm_medium=referral)
 		
What you need
---

* [CommonUIAlert.h](https://github.com/Ericfengshi/CommonUIAlert/blob/master/CommonUIAlert.h)
* [CommonUIAlert.m](https://github.com/Ericfengshi/CommonUIAlert/blob/master/CommonUIAlert.m)

* [AlertController.h](https://github.com/dbettermann/AlertController/blob/master/AlertController/Source/AlertController.h)
* [AlertController.m](https://github.com/dbettermann/AlertController/blob/master/AlertController/Source/AlertController.m)
* [UIAlertView+IABlocks.h](https://github.com/Innovattic/UIKit-Blocks/blob/master/UIAlertView%2BIABlocks.h)
* [UIAlertView+IABlocks.m](https://github.com/Innovattic/UIKit-Blocks/blob/master/UIAlertView%2BIABlocks.m)

How to use
---  

```objective-c
[[CommonUIAlert alloc] showCommonAlertViewMessage:@"用户名不能为空!"];

[[CommonUIAlert alloc] showCommonAlertViewTitle:@"温馨提示" message:@"有新版本，请更新应用" cancelButtonTitle:@"取消" otherButtonTitle:@"确认" cancle:^(){
} confirm:^(){
}];
    
```

## only message

```objective-c
- (void)showCommonAlertViewMessage:(NSString *)message;
```


## message and delegate

```objective-c
-(void)showCommonAlertViewTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle 
cancle:(void (^)())cancle confirm:(void (^)())confirm;
```
