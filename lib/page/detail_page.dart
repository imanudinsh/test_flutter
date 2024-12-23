
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Detail"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share))
        ],
      ),
      body: Text("Hallo $data") // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}