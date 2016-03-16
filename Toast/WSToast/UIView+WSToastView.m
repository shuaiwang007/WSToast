//
//  UIView+WSToastView.m
//  Toast
//
//  Created by 王帅 on 16/3/16.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import "UIView+WSToastView.h"
#import "WSToastView.h"
#import <MBProgressHUD.h>

#define TOASTSHOWTIME 1.5

@implementation UIView (IKToastView)
- (void)makeToastWithOnlyText:(NSString *)message
                     toView:(UIView *)view
               cornerRadius:(CGFloat)radius
             msgViewBgColor:(UIColor *)bgColor
                  textColor:(UIColor *)textColor
                   textFont:(UIFont *)textFont
              dimBackground:(BOOL)background
                 afterDelay:(CGFloat)delayTime{
    
    if (view == nil){
        
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200);
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.0f;               // 默认为20
    hud.removeFromSuperViewOnHide = YES;
    
    // 设置圆角数值
    if(radius != 20){
        
        hud.cornerRadius = radius;
    }else{
        
        hud.cornerRadius = 15;
    }
    
    // 设置提示框背景色
    if(bgColor != nil){
        
        hud.color = bgColor;
    }
    
    // 设置提示框文字颜色
    if(textColor != nil){
        
        hud.labelColor = textColor;
    }
    
    // 设置提示框文字字体大小
    if(textFont != nil){
        
        hud.labelFont = textFont;
    }
    
    // 设置提示框出现时的遮罩层
    hud.dimBackground = background;
    
    // 设置提示框出现的时间
    if(delayTime != 3){
        
        [hud hide:YES afterDelay:delayTime];
    }else{
        
        [hud hide:YES afterDelay:3];
    }
    
}

- (void)makeToastWtihCustomView:(UIView *)customView
                   msgContent:(NSString *)message
                       toView:(UIView *)view
               msgViewBgColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     textFont:(UIFont *)textFont
                dimBackground:(BOOL) background
                   afterDelay:(CGFloat)delayTime{
    
    if (view == nil){
        
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = customView;
    hud.labelText = message;
    hud.margin = 20.0f;               // 默认为20
    hud.removeFromSuperViewOnHide = YES;
    
    // 设置圆角数值
    hud.cornerRadius = 10;
    
    // 设置提示框背景色
    if(bgColor != nil){
        
        hud.color = bgColor;
    }
    
    // 设置提示框文字颜色
    if(textColor != nil){
        
        hud.labelColor = textColor;
    }
    
    // 设置提示框文字字体大小
    if(textFont != nil){
        
        hud.labelFont = textFont;
    }
    
    // 设置提示框出现时的遮罩层
    hud.dimBackground = background;
    
    // 设置提示框出现的时间
    if(delayTime != 3){
        
        [hud hide:YES afterDelay:delayTime];
    }else{
        
        [hud hide:YES afterDelay:3];
    }
    
}

- (void)makeToast:(NSString *)msg
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    for (UIView *view in window.subviews) {
        if ([view isKindOfClass:[WSToastView class]]) {
            [view removeFromSuperview];
        }
    }
    WSToastView *toast = [[WSToastView alloc] init];
    toast.contenInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    [toast showMessage:msg showTime:TOASTSHOWTIME];
}

@end
