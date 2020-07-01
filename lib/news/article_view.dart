import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  final String posturl;
  Article({this.posturl});
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  Image appLogo = new Image(
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: appLogo,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.posturl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
