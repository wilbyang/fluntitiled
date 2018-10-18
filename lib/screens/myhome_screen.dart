import 'package:fluntitled/post_data.dart';
import 'package:fluntitled/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fluntitled/models/post.dart';
enum _StockMenuItem { autorefresh, refresh, speedUp, speedDown }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(child: ListView(
        children: <Widget>[
          DrawerHeader(child: Center(child: Text('Stocks'))),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Stock List'),
            selected: true,
          ),
          ListTile(
            leading: Icon(Icons.add_alarm),
            title: Text('Stock List'),
            selected: true,
          ),
          ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Stock List'),
            selected: true,
          ),
        ],
      ),),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          PopupMenuButton<_StockMenuItem>(
            onSelected: (_StockMenuItem value) {},
            itemBuilder: (BuildContext context) => <PopupMenuItem<_StockMenuItem>>[
              new CheckedPopupMenuItem<_StockMenuItem>(
                value: _StockMenuItem.autorefresh,

                child: const Text('Autorefresh'),
              ),
              const PopupMenuItem<_StockMenuItem>(
                value: _StockMenuItem.refresh,
                child: Text('Refresh'),
              ),
              const PopupMenuItem<_StockMenuItem>(
                value: _StockMenuItem.speedUp,
                child: Text('Increase animation speed'),
              ),
              const PopupMenuItem<_StockMenuItem>(
                value: _StockMenuItem.speedDown,
                child: Text('Decrease animation speed'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(12.0),
          child: FutureBuilder<List<Post>>(
            future: PostData.fetchPosts(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? PostList(posts: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          )
      ),


      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}