import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> _getToken() async {
    Map<String, dynamic> data = {
      'username': 'sirikanlaya.s@sskru.ac.th',
      'password': 'numvarn',
    };

    final responese = await Http.post(
      'https://durian-lava.herokuapp.com/api/login',
      body: data,
    );

    print(responese.body);

    return responese.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demos'),
      ),
      body: FutureBuilder(
        future: _getToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${snapshot.data}',
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
