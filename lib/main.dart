import 'package:flutter/material.dart';

import './webview_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) => InkWell(
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return WebviewPage(
                        title: "dsasddg",
                      );
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('To Webview Page'),
                      Icon(
                        Icons.send,
                        color: Colors.blue,
                      )
                    ]
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
