
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/data/local_data_repository.dart';
import 'package:test_flutter/model/User.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  LocalDataRepository repository = LocalDataRepository();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  List<User> dataUser = [];

  var isObscure = true;

  @override
  void initState() {
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Register"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
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

                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    label: Text("Nama"),
                  ),
                ),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                  ),
                ),

                const SizedBox(height: 30,),

                MaterialButton(
                  onPressed: () async {
                    var username = usernameController.text;
                    var password = passwordController.text;
                    var email = emailController.text;
                    var name = nameController.text;

                    var user = User(
                        username: username,
                        password: password,
                        nama: name,
                        email: email
                    );

                    var save = await repository.insert(user);
                    if(save  == 1) {
                      getData();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(" Data berhasil disimpan"),

                          )
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(" Data gagal disimpan"),

                          )
                      );
                    }


                  },
                  color: Colors.blue,

                  child: const Text("Submit", style: TextStyle(color: Colors.white),),
                ),

                ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 30),
                  children: dataUser.map(
                      (item) => Row(
                        children: [
                          Expanded(child: Text(item.toJson().toString()),),
                          MaterialButton(
                            onPressed: () async {
                              await repository.delete(item.id!);
                              getData();
                            },
                            color: Colors.red,
                            child: const Text("Hapus", style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      )
                  ).toList()
                )
              ],
            ),
          ),
        )
    );
  }

  Future<void> getData() async {
    var users = await repository.getData();
    setState(() {
      dataUser = users;
    });
  }
}