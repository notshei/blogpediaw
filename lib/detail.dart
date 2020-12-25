import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:blogpediav2/models/models.dart';

//import 'dart:html';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});

  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("${widget.list[widget.index]['judul']}")),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                Flexible(
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Html(
                      data: widget.list[widget.index]['isi_post'],
                    ),
                  ),
                ),
                //     Image.network("http://10.0.2.2/miniblog/assets/img/post/" )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
