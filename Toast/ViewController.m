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
        _textBtn = [[UIButton alloc] init];
        [self createABtn:_textBtn Tag:textBtnTypeNormal Title:@"点我"];
       
    }
    return _textBtn;
}

- (UIButton *)textBtn2 {
    if (!_textBtn2) {
        _textBtn2 = [[UIButton alloc] init];
        [self createABtn:_textBtn2 Tag:textBtnTypeTwo Title:@"点我2"];
       
    }
    return _textBtn2;
}

- (UIButton *)textBtn3 {
    if (!_textBtn3) {
        _textBtn3 = [[UIButton alloc] init];
        [self createABtn:_textBtn3 Tag:textBtnTypeThree Title:@"点我3"];
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
            [self.textBtn3 makeToastWtihCustomView:self.customView msgContent:@"55555" toView:self.view msgViewBgColor:[UIColor blackColor] textColor:[UIColor whiteColor] textFont:[UIFont systemFontOfSize:12] dimBackground:YES afterDelay:2.0];
        default:
            break;
    }
    
}

- (UIButton *)createABtn:(UIButton *)btn Tag:(NSInteger)tag Title:(NSString *)title {
    
    btn.tag  =tag;
    btn.frame = CGRectMake(30, 150, 80, 30);
    btn.backgroundColor = [UIColor darkGrayColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(textBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
