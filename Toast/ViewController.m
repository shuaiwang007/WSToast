//
//  ViewController.m
//  Toast
//
//  Created by 王帅 on 16/3/16.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+WSToastView.h"
#import "CustomView.h"


@interface ViewController ()
@property(nonatomic, copy) UIButton *textBtn;
@property(nonatomic, copy) UIButton *textBtn2;
@property(nonatomic, copy) UIButton *textBtn3;
@property(nonatomic, copy) CustomView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buildUI];
}

- (void)buildUI {
    [self.view addSubview:self.textBtn];
    [self.view addSubview:self.textBtn2];
    [self.view addSubview:self.textBtn3];

}

- (CustomView *)customView {
    if (!_customView) {
        _customView = [[[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil] lastObject];
        _customView.frame = CGRectMake(0, 0, 20, 20);
    }
    return _customView;
}

- (UIButton *)textBtn {
    if (!_textBtn) {
        _textBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 50, 80, 30)];
        _textBtn.tag = textBtnTypeNormal;
        _textBtn.backgroundColor =[UIColor darkGrayColor];
        [_textBtn setTitle:@"点我" forState:UIControlStateNormal];
        [_textBtn addTarget:self action:@selector(textBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _textBtn;
}

- (UIButton *)textBtn2 {
    if (!_textBtn2) {
        _textBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(30, 100, 80, 30)];
        _textBtn2.tag = textBtnTypeTwo;
        _textBtn2.backgroundColor =[UIColor darkGrayColor];
        [_textBtn2 setTitle:@"点我2" forState:UIControlStateNormal];
        [_textBtn2 addTarget:self action:@selector(textBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _textBtn2;
}

- (UIButton *)textBtn3 {
    if (!_textBtn3) {
        _textBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(30, 150, 80, 30)];
        _textBtn3.tag = textBtnTypeThree;
        _textBtn3.backgroundColor =[UIColor darkGrayColor];
        [_textBtn3 setTitle:@"点我3" forState:UIControlStateNormal];
        [_textBtn3 addTarget:self action:@selector(textBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _textBtn3;
}


- (void)textBtnOnClick:(UIButton *)btn {
    switch (btn.tag) {
        case textBtnTypeNormal:
            [self.textBtn makeToast:@"正在加载哦..."];
            break;
        case textBtnTypeTwo:
            [self.textBtn2 makeToastWithOnlyText:@"天灰灰。。。" toView:self.view cornerRadius:5.0 msgViewBgColor:[UIColor lightGrayColor] textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:12] dimBackground:YES afterDelay:2.0];
            break;
        case textBtnTypeThree:
            [self.textBtn3 makeToastWtihCustomView:self.customView msgContent:@"55555" toView:self.view msgViewBgColor:[UIColor redColor] textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:12] dimBackground:YES afterDelay:2.0];
        default:
            break;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
