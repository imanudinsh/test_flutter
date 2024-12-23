
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/model/User.dart';

class LearningDartPage extends StatefulWidget {
  const LearningDartPage({super.key});


  @override
  State<LearningDartPage> createState() => _LearningDartPageState();
}

class _LearningDartPageState extends State<LearningDartPage> {

  List<User> users = [];

  @override
  void initState() {
    // var user = User(
    //   name: "Dadan",
    //   email: "dadan@gmail.com"
    // );
    //
    //
    // users.add(user);
    // users.add(User(
    //     name: "Beben",
    //     email: "beben@gmail.com"
    // ));
    // users.add(User(
    //     name: "Lala",
    // ));
    // users.add(User(
    //     name: "Dika",
    //     email: "dika@gmail.com"
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    printUser();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Learning Dart"),
        ),
        body: Column(
          children: [
            // Text("Nama : ${user.name}"),
            // Text("Email : ${user.email}"),
          ],
        )
    );
  }


  User getLastUser(){
    var user = users.lastWhere((e) => e.nama != "Beben");
    return user;
  }

  void deleteUser(){
    users.removeLast();
  }

  Future<String> getData() async {

    await Timer(Duration(milliseconds: 1000), (){});
    deleteUser();
    return getLastUser().email!!;
  }

  void printUser() async {
    debugPrint("users : ${await getData()}");
  }
}
