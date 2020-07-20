import 'package:flutter/material.dart';
import '../services/post_service.dart';
import '../widgets/item_list_widget.dart';

class ItemListPage extends StatelessWidget {
  final String title;
  ItemListPage({this.title});

  final items = PostService().getPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ItemListWidget(
          items: items,
        ));
  }
}
