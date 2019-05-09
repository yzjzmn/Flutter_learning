# one_project

A new Flutter project.

一些感悟:
原生与flutter进行交互的时候,要在原生文件中注册FlutterMethodChannel,类似于JSBridge注册handle的操作
有些操作还是要原生来处理,比如flutter的第三方库permission_handler(帮我们请求用户权限的工具),在原生appDelegate中注册
FlutterViewController : UIViewController <FlutterBinaryMessenger, FlutterTextureRegistry, FlutterPluginRegistry>
看FlutterViewController的结构类似于webView承载着JS内容的混合开发,不过是具体实现不同

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
