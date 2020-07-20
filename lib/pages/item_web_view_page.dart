import 'package:flutter/material.dart';
import 'package:web_view_app/widgets/my_simple_web_view_widget.dart';
import '../models/item.dart';

class ItemWebViewPage extends StatelessWidget {
  final Item article;
  ItemWebViewPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.article.title),
        ),
        body: MySimpleWebViewWidget(
          slug: this.article.slug,
        ));
  }
}
