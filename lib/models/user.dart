import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userId,
    this.username,
    this.password,
    this.role,
    this.wargaId,
    this.wargaName,
    this.wargaGender,
    this.wargaAlamat,
    this.wargaPhone,
  });

  String userId;
  String username;
  String password;
  String role;
  String wargaId;
  String wargaName;
  String wargaGender;
  String wargaAlamat;
  String wargaPhone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
        wargaId: json["warga_id"],
        wargaName: json["warga_name"],
        wargaGender: json["warga_gender"],
        wargaAlamat: json["warga_alamat"],
        wargaPhone: json["warga_phone"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "password": password,
        "role": role,
        "warga_id": wargaId,
        "warga_name": wargaName,
        "warga_gender": wargaGender,
        "warga_alamat": wargaAlamat,
        "warga_phone": wargaPhone,
      };
}
