//
//  WSToastView.m
//  Toast
//
//  Created by 王帅 on 16/3/16.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import "WSToastView.h"
#import "IKExtension.h"

@implementation WSToastView

- (instancetype)init
{
    if (self = [super init]) {
        [self showView];
    }
    return self;
}

- (void)showView
{
    _containerView = [UIView new];
    _containerView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    _containerView.layer.cornerRadius = 5;
    _containerView.clipsToBounds = YES;
    [self addSubview:_containerView];
    
    _messageLabel = [UILabel new];
    _messageLabel.textColor = [UIColor whiteColor];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    _messageLabel.font = [UIFont systemFontOfSize:TOAST_FONT_SIZE];
    _messageLabel.numberOfLines = 0;
    _messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [_containerView addSubview:_messageLabel];
}

- (void)addConstraintWithMessage:(NSString *)message
{
    _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    _messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat messageWidth = TOAST_MAX_WIDTH - _contenInsets.left - _contenInsets.right;
    CGFloat messageHeight = TOAST_MAX_HEIGHT - _contenInsets.top - _contenInsets.bottom;
    CGSize size = [message textSizeWithFont:[UIFont systemFontOfSize:TOAST_FONT_SIZE + 1] constrainedToSize:CGSizeMake(messageWidth,messageHeight) lineBreakMode:NSLineBreakByCharWrapping];
    messageWidth = size.width < TOAST_MIN_WIDTH - _contenInsets.left - _contenInsets.right? TOAST_MIN_WIDTH - _contenInsets.left - _contenInsets.right : size.width;
    messageHeight = size.height < TOAST_MIN_HEIGHT - _contenInsets.top - _contenInsets.bottom ? TOAST_MIN_HEIGHT - _contenInsets.top - _contenInsets.bottom : size.height;
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    [window addSubview:self];
    
    [window addConstraints:@[[NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:window
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0],
                             [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:window
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:0],
                             [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:window
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0],
                             [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:window
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:0]
                             ]];
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:_containerView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1
                                                         constant:messageWidth + _contenInsets.left + _contenInsets.right],
                           [NSLayoutConstraint constraintWithItem:_containerView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1
                                                         constant:messageHeight + _contenInsets.top + _contenInsets.bottom],
                           [NSLayoutConstraint constraintWithItem:_containerView
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterX
                                                       multiplier:1
                                                         constant:0],
                           [NSLayoutConstraint constraintWithItem:_containerView
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self
                                                        attribute:NSLayoutAttributeCenterY
                                                       multiplier:1
                                                         constant:100]
                           ]];
    
    [_containerView addConstraints:@[[NSLayoutConstraint constraintWithItem:_messageLabel
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_containerView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1
                                                                   constant:_contenInsets.top],
                                     [NSLayoutConstraint constraintWithItem:_messageLabel
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_containerView
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:_contenInsets.left],
                                     [NSLayoutConstraint constraintWithItem:_messageLabel
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_containerView
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1
                                                                   constant:-_contenInsets.bottom],
                                     [NSLayoutConstraint constraintWithItem:_messageLabel
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_containerView
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1
                                                                   constant:-_contenInsets.right]
                                     ]];
}

- (void)showMessage:(NSString *)message showTime:(NSTimeInterval)timeinterval
{
    _messageLabel.text = message;
    [self addConstraintWithMessage:message];
    [self performSelector:@selector(hideView) withObject:nil afterDelay:timeinterval];
}

- (void)hideView
{
    [_messageLabel removeFromSuperview];
    [_containerView removeFromSuperview];
    [self removeFromSuperview];
}


@end
