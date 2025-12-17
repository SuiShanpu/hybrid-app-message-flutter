import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebviewPage extends StatefulWidget {
  final String? title;

  const WebviewPage({super.key, this.title});

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {

  final String H5_URL = "http://10.152.32.120:3001/"; // 这里使用 h5 页面地址 

  final WebViewController _webViewController = WebViewController();

  @override
  void initState() {
    initWebView();
    super.initState();
  }

  initWebView() {
    _webViewController
      ..setBackgroundColor(Colors.white)
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // 允许js代码
      // 加载网络h5页面 (http地址)
      ..loadRequest(Uri.parse(H5_URL));
      

    // 与H5页面进行通信的桥梁
    _webViewController
      .addJavaScriptChannel(
        // 会在H5的window上挂载一个FlutterBridge对象，该对象包含一个postMessage方法发送数据给flutter
        "flutterBridge",
        onMessageReceived: (JavaScriptMessage jsMsg) {
          print("JavaScriptMessage: ${jsMsg}");
          String message = jsMsg.message; // 根据 h5 传递的数据类型进行接收

          _sendFlutterTestMessage();
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView Page"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: _webViewController
              )
            ),
          ],
        )
      )
    );
  }

  // 从flutter 发送信息
  _sendFlutterTestMessage() async {
    // 构造要传递的参数（支持任意类型：对象、数组、字符串、数字等）
    final Map<String, dynamic> msgFlutter = {
      "msg": "这是 flutter 中的传递过来的值",
    };

    // 调用 h5 页面中脚本方法
    _webViewController.runJavaScript('''
      receiveFromFlutter(${jsonEncode(msgFlutter)});
    ''');
  }

}
