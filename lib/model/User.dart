
import 'dart:convert';



   User userFromJson(String str) => User.fromJson(json.decode(str));

   String userToJson(User data) => json.encode(data.toJson());

 class User {
   int? id;
   String username;
   String password;
   String nama;
   String email;

   User({
      this.id,
   required this.username,
   required this.password,
   required this.nama,
   required this.email,
   });

   factory User.fromJson(Map<String, dynamic> json) => User(
   id: json["id"],
   username: json["username"],
   password: json["password"],
   nama: json["nama"],
   email: json["email"],
   );

   Map<String, dynamic> toJson() => {
   "id": id,
   "username": username,
   "password": password,
   "nama": nama,
   "email": email,
   };
}