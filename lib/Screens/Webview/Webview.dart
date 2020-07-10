import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Webwiew extends StatefulWidget {
  @override
  _WebwiewState createState() => _WebwiewState();
}

class _WebwiewState extends State<Webwiew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: WebviewScaffold(
            url: "http://www.fitfusionpr.com/",
          ),
        ));
  }
}
