import 'package:flutter/material.dart';
import '../models/item.dart';
import '../pages/item_web_view_page.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  ItemTile(this.item);

  @override
  Widget build(BuildContext context) {
    return _columnTile(context, item);
  }

  Widget _columnTile(BuildContext context, Item item) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemWebViewPage(item)));
        },
        child: _columnTileContainer(item));
  }

  Widget _columnTileContainer(Item item) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _thumbnail(item),
          _title(item.title,
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          // _title(item.description, TextStyle(fontSize: 14.0))
        ],
      ),
    );
  }

  Widget _thumbnail(Item item) {
    return Container(
        constraints: BoxConstraints.tightFor(width: 100.0),
        child: Image.network(
          item.cover,
          fit: BoxFit.fitHeight,
        ));
  }

  Widget _title(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
