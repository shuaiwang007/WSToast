# WSToast
封装Toast，可直接调接口使用，并可高度自定义（同时封装了NSData、NSString）
![No.1](http://7xrv08.com1.z0.glb.clouddn.com/toast1.png)
![No.2](http://7xrv08.com1.z0.glb.clouddn.com/toast2.png)
![No.3](http://7xrv08.com1.z0.glb.clouddn.com/toast3.png)
###使用方法
#####使用前提
> *pod MBProgressHUD

> 将工程里的WSToast文件夹拖入你的工程，这个文件夹里封装了Toast、NSData、NSString。使用者可调用UIView+WSToastView.h中的接口即可。
> 
> 
> 

#####接口说明
>/**
>@brief 实现‘toast’样式的提示信息
>
>@param message 需要显示的信息
>
>@param view 信息提示框所在view，如传nil则默认其为应用的最上层view
>
>@param radius 信息提示框的圆角数值 默认为10
>
>@param bgColor 信息提示框的背景颜色 如传nil则默认为黑色
>
>@param textColor 信息提示框内的字体颜色 如传nil默认为白色
>
>@param textFont 信息提示框内的字体大小 如传nil默认为16
>
>@param background 信息框出现时是否带遮罩层
>
>@param delayTime 信息框在view上停留的时间 默认为3s
>

>
* - (void)makeToastWithOnlyText:(NSString *)message
toView:(UIView *)view
cornerRadius:(CGFloat)radius
msgViewBgColor:(UIColor *)bgColor
textColor:(UIColor *)textColor
textFont:(UIFont *)textFont
dimBackground:(BOOL)background
afterDelay:(CGFloat)delayTime;

>/**
>@brief 实现部分自定义view的提示信息
>
>@param cutomView 自定义的view
>
>@param message 需要显示的信息
>
>@param view 信息提示框所在view，如传nil则默认其为应用的最上层view
>
>@param bgColor 信息提示框的背景颜色 如传nil则默认为黑色
>
>@param textColor 信息提示框内的字体颜色 如传nil默认为白色
>
>@param textFont 信息提示框内的字体大小 如传nil默认为16
>
>@param background 信息框出现时是否带遮罩层
>
>@param delayTime 信息框在view上停留的时间 默认为3s
>

>* - (void)makeToastWtihCustomView:(UIView *)customView
>msgContent:(NSString *)message
toView:(UIView *)view
msgViewBgColor:(UIColor *)bgColor
textColor:(UIColor *)textColor
textFont:(UIFont *)textFont
dimBackground:(BOOL) background
afterDelay:(CGFloat)delayTime;

>// 直接显示提示。
>
- (void)makeToast:(NSString *)msg;

####示例如Demo所示。


