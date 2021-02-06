import 'dart:convert';

import 'package:ProviderDemos/models/setting_model.dart';
import 'package:ProviderDemos/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:provider/provider.dart';

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

    return responese.body;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingModel>(
      builder: (context, setting, child) => Scaffold(
        appBar: AppBar(
          title: Text('Provider Demos'),
        ),
        body: FutureBuilder(
          future: _getToken(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              setting.value = jsonDecode(snapshot.data);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${setting.value['token']}',
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NextPage()));
          },
          tooltip: 'Increment',
          child: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
