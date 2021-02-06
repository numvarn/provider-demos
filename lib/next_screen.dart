import 'package:ProviderDemos/models/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingModel>(
      builder: (context, setting, child) => Scaffold(
        appBar: AppBar(
          title: Text('Next Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${setting.value}'),
            ],
          ),
        ),
      ),
    );
  }
}
