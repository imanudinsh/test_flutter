
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/detail_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> data = ["Budi", "Lulu", "Lala", "Kevin", "Tika"];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        shadowColor: Colors.grey,
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share))
        ],
        leading: Icon(Icons.menu),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i){
            return InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (ctx) =>   DetailPage() ));
                Navigator.pushNamed(context, "/detail", arguments: data[i]);
              },
              child: Container(
                width: 500,
                height: 50,
                margin: EdgeInsets.all( 5),
                padding: EdgeInsets.all( 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12,width: 1),
                    boxShadow: const [
                      BoxShadow(color: Colors.blueAccent, blurRadius: 2)
                    ]
                ),

                child: Row(
                  children: [
                    Image.asset("assets/images/gmaps.png"),
                    Text(data[i], style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}