import 'dart:async';
import 'dart:convert';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './detail.dart';
//import './category.dart' as ct;

// ignore: must_be_immutable
class PostCate extends StatefulWidget {
  List list;
  int index;
  PostCate({this.list, this.index});
  @override
  _PostCateState createState() => _PostCateState();
}

class _PostCateState extends State<PostCate> {
  Future<List> getData() async {
    final response = await http.get("http://10.0.2.2/miniblog/getpostcate.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Posts"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        //  String image;
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['judul'],
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                // leading: new Image.network(
                //     "http://10.0.2.2/miniblog/assets/img/post" + image),
                //  leading: new Icon(Icons.image),
                subtitle: new Text(
                    "Oleh : ${list[i]['username']} \nDibaca ${list[i]['read']} kali"),
                dense: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
