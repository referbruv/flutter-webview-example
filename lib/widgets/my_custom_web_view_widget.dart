import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_view_app/constants/config.dart';
import 'package:web_view_app/models/item.dart';
import 'package:web_view_app/services/post_service.dart';
import 'package:web_view_app/widgets/spinner_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyCustomWebViewWidget extends StatelessWidget {
  final String slug;
  MyCustomWebViewWidget({this.slug});
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // render content via the builder
      builder: (context, snapshot) {
        // render content if data is available
        if (snapshot.hasData) {
          var data = snapshot.data as Item;
          // render a webview on the body
          return WebView(
              // initialUrl should always be given, can't be omitted
              initialUrl: '${Config.baseUri}/blog/posts/${data.slug}',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) async {
                // the callback triggers once the load is complete
                // data.content contains the HTML content
                // convert the HTML content into a Base64 content
                final String contentBase64 =
                    base64Encode(const Utf8Encoder().convert(data.content));

                // load the Base64 converted content into the WebView
                // using the webViewController provided in the callback
                await webViewController
                    .loadUrl('data:text/html;base64,$contentBase64');

                // finally signal a complete() to the completer
                _controller.complete(webViewController);
              });
        }
        // show a spinner until the data is available
        return SpinnerWidget();
      },
      // source of data for the builder
      future: PostService().getSingle(this.slug),
    );
  }
}
