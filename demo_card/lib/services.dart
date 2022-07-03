import 'dart:developer';

import "package:http/http.dart" as http;
import "menu_2.dart";
import 'sub.dart';

class Services{

  static Future<List<Menu>> getMenu() async{
    try{
      final response = await http.get(Uri.parse("https://tushar725mittal.github.io/menu.json"));
      if(200 == response.statusCode){
        final List<Menu> menu = menuFromJson(response.body);
        log("loaded menu");
        return menu;
      }else{
        log("else");
        return List.empty();
      }
    }catch(e){
      return List.empty();
    }
  }
  static Future<List<Sub>> getSub() async{
    
      final response = await http.get(Uri.parse("https://tushar725mittal.github.io/subscription.json"));
      if(200 == response.statusCode){
        log("loaded sub");
        final List<Sub> sub = subFromJson(response.body);
        return sub;
      }else{
        log("else");
        return List.empty();
      }
    
  }
}