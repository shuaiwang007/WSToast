//
//  WSToastView.h
//  Toast
//
//  Created by 王帅 on 16/3/16.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IK_DEVICE_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define TOAST_MAX_WIDTH            IK_DEVICE_WIDTH - 40
#define TOAST_MAX_HEIGHT           200
#define TOAST_MIN_WIDTH            100
#define TOAST_MIN_HEIGHT           35
#define TOAST_FONT_SIZE            15

@interface WSToastView : UIView

@property (nonatomic, strong, readonly) UIView *containerView;
@property (nonatomic, strong, readonly) UILabel *messageLabel;
@property (nonatomic, assign) UIEdgeInsets contenInsets;
@property (nonatomic, assign) CGPoint centerPosition;

- (void)showMessage:(NSString *)message showTime:(NSTimeInterval)timeinterval;

@end
