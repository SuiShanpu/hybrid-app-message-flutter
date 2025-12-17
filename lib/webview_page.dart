import 'dart:convert';

import 'package:flutter/material.dart';


class WebviewPage extends StatefulWidget {
  final String? title;

  const WebviewPage({super.key, this.title});

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {

  @override
  void initState() {
    super.initState();
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
            Text("这是一个包含 WebView 的页面"),
          ],
        )
      )
    );
  }

}
