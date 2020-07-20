import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_view_app/constants/config.dart';
import 'package:web_view_app/models/item.dart';

class PostService {
  Future<List<Item>> getPosts() async {
    var url = '${Config.baseUri}/api/posts';
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var content = res.body;
        var arr = json.decode(content) as List;
        // for every element of arr map to _fromJson
        // and convert the array to list
        return arr.map((e) => _fromJson(e)).toList();
      }
    } catch (err) {
      print(err);
    } finally {}
    return List<Item>();
  }

  Item _fromJson(Map<String, dynamic> item) {
    return new Item(
        content: item['content'],
        description: item['description'],
        title: item['title'],
        cover: "${Config.baseUri}/${item['cover']}",
        slug: "${item['slug']}");
  }

  Future<Item> getSingle(String slug) async {
    var url = '${Config.baseUri}/api/posts/$slug';
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var content = res.body;
        var e = json.decode(content) as Map<String, dynamic>;
        return _fromJson(e);
      }
    } catch (err) {
      print(err);
    } finally {}
    return Item();
  }
}
