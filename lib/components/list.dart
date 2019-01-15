import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class List extends StatefulWidget {
  @override
  ListState createState() => new ListState();
}

// dio实例
class ListState extends State<List> {
  var data;

  getData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        result = jsonDecode(json);
      } else {
        result = "Error getting JSON data:\nHttp status ${response.statusCode}";
      }
    } catch (exception) {
      result = 'Failed getting json data';
    }
    if (!mounted) {
      return;
    }
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

}
