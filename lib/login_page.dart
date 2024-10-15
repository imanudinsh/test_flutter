
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isObscure = true;
  var items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Login"),
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
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$role ${usernameController.text} ${passwordController.text}"),

                        )
                    );
                  },
                  color: Colors.blue,

                  child: const Text("Login", style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        )
    );
  }
}