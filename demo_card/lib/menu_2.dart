// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Menu> menuFromJson(String str) => List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
    Menu({
        required this.name,
        required this.firstWeek,
        required this.secondWeek,
        required this.thirdWeek,
        required this.fourthWeek,
    });

    String name;
    List<Week> firstWeek;
    List<Week> secondWeek;
    List<Week> thirdWeek;
    List<Week> fourthWeek;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        name: json["name"],
        firstWeek: List<Week>.from(json["firstWeek"].map((x) => Week.fromJson(x))),
        secondWeek: List<Week>.from(json["secondWeek"].map((x) => Week.fromJson(x))),
        thirdWeek: List<Week>.from(json["thirdWeek"].map((x) => Week.fromJson(x))),
        fourthWeek: List<Week>.from(json["fourthWeek"].map((x) => Week.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "firstWeek": List<dynamic>.from(firstWeek.map((x) => x.toJson())),
        "secondWeek": List<dynamic>.from(secondWeek.map((x) => x.toJson())),
        "thirdWeek": List<dynamic>.from(thirdWeek.map((x) => x.toJson())),
        "fourthWeek": List<dynamic>.from(fourthWeek.map((x) => x.toJson())),
    };
}

class Week {
    Week({
        required this.day,
        required this.food,
    });

    String day;
    String food;

    factory Week.fromJson(Map<String, dynamic> json) => Week(
        day: json["day"],
        food: json["food"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "food": food,
    };
}
