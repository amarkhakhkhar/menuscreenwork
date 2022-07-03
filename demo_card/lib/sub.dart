// To parse this JSON data, do
//
//     final sub = subFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Sub> subFromJson(String str) => List<Sub>.from(json.decode(str).map((x) => Sub.fromJson(x)));

String subToJson(List<Sub> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sub {
    Sub({
        required this.name,
        required this.subsciptionType,
        required this.subscriptionId,
        required this.image,
        required this.endDate,
        required this.startDate,
        required this.takeAwayAddress,
        required this.deliveryAddress,
    });

    String name;
    String subsciptionType;
    String subscriptionId;
    String? image;
    int endDate;
    int startDate;
    String takeAwayAddress;
    String deliveryAddress;

    factory Sub.fromJson(Map<String, dynamic> json) => Sub(
        name: json["name"],
        subsciptionType: json["subsciptionType"],
        subscriptionId: json["subscriptionID"],
        image: json["image"] == null ? null : json["image"],
        endDate: json["endDate"],
        startDate: json["startDate"],
        takeAwayAddress: json["takeAwayAddress"],
        deliveryAddress: json["deliveryAddress"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "subsciptionType": subsciptionType,
        "subscriptionID": subscriptionId,
        "image": image == null ? null : image,
        "endDate": endDate,
        "startDate": startDate,
        "takeAwayAddress": takeAwayAddress,
        "deliveryAddress": deliveryAddress,
    };
}
