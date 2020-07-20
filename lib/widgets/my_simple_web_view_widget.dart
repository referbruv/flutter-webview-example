import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_view_app/constants/config.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MySimpleWebViewWidget extends StatelessWidget {
  final String slug;
  MySimpleWebViewWidget({this.slug});
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      // initialUrl should always be given, can't be omitted
      initialUrl: '${Config.baseUri}/blog/posts/$slug',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) async {
        // finally signal a complete() to the completer
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains("about")) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      gestureNavigationEnabled: true,
    );
  }
}
