import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import './detail.dart';
import './home.dart' as ho;
import './category.dart' as cate;
import './search.dart' as sea;
//import './tabbar.dart';

void main() {
  runApp(new MaterialApp(
    title: "BlogPedia",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Future<List> getData() async {
    final response = await http.get("http://10.0.2.2/miniblog/getdata.php");
    //final response = await http
    // .get("http://10.0.2.2/miniblog/application/config/getdata.php");
    return json.decode(response.body);
  }

  TabController controller;

  void initState() {
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BlogPedia"),
      ),
      // body: new FutureBuilder<List>(
      //   future: getData(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) print(snapshot.error);

      //     return snapshot.hasData
      //         ? new ItemList(
      //             list: snapshot.data,
      //           )
      //         : new Center(
      //             child: new CircularProgressIndicator(),
      //           );
      //   },
      // ),

      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new ho.Homey(),
          new cate.Category(),
          new sea.Search(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
              text: "Home",
            ),
            new Tab(icon: new Icon(Icons.category), text: "Category"),
            new Tab(
              icon: new Icon(Icons.search),
              text: "Search",
            )
          ],
        ),
      ),
    );
  }
}

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return new ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         //  String image;
//         return Container(
//           padding: const EdgeInsets.all(10.0),
//           child: new GestureDetector(
//             onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                 builder: (BuildContext context) => new Detail(
//                       list: list,
//                       index: i,
//                     ))),
//             child: new Card(
//               child: new ListTile(
//                 title: new Text(
//                   list[i]['judul'],
//                   textAlign: TextAlign.left,
//                   style: new TextStyle(
//                       fontSize: 16.0, fontWeight: FontWeight.bold),
//                 ),
//                 // leading: new Image.network(
//                 //     "http://10.0.2.2/miniblog/assets/img/post" + image),
//                 leading: new Icon(Icons.image),
//                 subtitle: new Text(
//                     "Oleh : ${list[i]['username']} \nDibaca ${list[i]['read']} kali"),
//                 dense: true,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
