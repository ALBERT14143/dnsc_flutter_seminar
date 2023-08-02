// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    int? id;
    String? fName;
    String? mName;
    String? lName;
    String? position;

    User({
        this.id,
        this.fName,
        this.mName,
        this.lName,
        this.position,
    });

    User copyWith({
        int? id,
        String? fName,
        String? mName,
        String? lName,
        String? position,
    }) => 
        User(
            id: id ?? this.id,
            fName: fName ?? this.fName,
            mName: mName ?? this.mName,
            lName: lName ?? this.lName,
            position: position ?? this.position,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        fName: json["fName"],
        mName: json["mName"],
        lName: json["lName"],
        position: json["position"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fName": fName,
        "mName": mName,
        "lName": lName,
        "position": position,
    };
}
