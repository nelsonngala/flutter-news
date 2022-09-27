import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewerScreen extends StatefulWidget {
  final String title;
  final String webUrl;

  const ArticleViewerScreen({
    Key? key,
    required this.title,
    required this.webUrl,
  }) : super(key: key);

  @override
  State<ArticleViewerScreen> createState() => _ArticleViewerScreenState();
}

class _ArticleViewerScreenState extends State<ArticleViewerScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 15),
          softWrap: true,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: .5,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.webUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
