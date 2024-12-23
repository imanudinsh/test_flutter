
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isObscure = true;
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  String? role;
  late SharedPreferences prefs;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Login"),
          leading: null,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                DropdownButton(
                  hint:Text( "Role"),
                    value: role,
                    items: items.map((e) => DropdownMenuItem(
                      value: e,
                        child: Text(e)
                    )).toList(),
                    onChanged: (e){
                      setState(() {
                        role = e;
                      });
                    })
                ,
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    label: Text("Username"),
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                            isObscure ? Icons.remove_red_eye_rounded: Icons.hide_source
                        )
                    )

                  ),
                ),

                const SizedBox(height: 30,),

                MaterialButton(
                  onPressed: () async {
                    await prefs.setString('username', usernameController.text);

                    prefs.clear();
                    String? username = prefs.getString('username');

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(" shared preferences $username"),

                        )
                    );
                  },
                  color: Colors.blue,

                  child: const Text("Login", style: TextStyle(color: Colors.white),),
                ),

                const SizedBox(
                  height: 30
                ),

                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text("Register"),
                )
              ],
            ),
          ),
        )
    );
  }

  initSharedPreferences() async{
    prefs = await SharedPreferences.getInstance();

  }
}