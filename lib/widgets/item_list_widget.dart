import 'package:flutter/material.dart';
import 'package:web_view_app/widgets/spinner_widget.dart';
import '../models/item.dart';
import './item_tile.dart';

class ItemListWidget extends StatelessWidget {
  final Future<List<Item>> items;

  ItemListWidget({this.items});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: items,
      builder: (context, snapshot) {
        // operation for completed state
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var item = snapshot.data[index];
                return ItemTile(item);
              });
        }
        // spinner for uncompleted state
        return SpinnerWidget();
      },
    );
  }
}
