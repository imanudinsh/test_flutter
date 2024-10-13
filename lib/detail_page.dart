
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Detail"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share))
        ],
      ),
      body: Text("Hallo") // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}