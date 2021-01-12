import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.name,
    this.time,
    this.comp,
    this.pName,
  });

  String name;
  String time;
  String comp;
  String pName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        time: json["time"],
        comp: json["comp"],
        pName: json["P_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
        "comp": comp,
        "pName": pName,
      };
}
