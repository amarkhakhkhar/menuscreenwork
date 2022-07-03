import 'dart:developer';

import 'package:flutter/material.dart';
import "services.dart";
import "menu_2.dart";
import "sub.dart";  
import 'package:jiffy/jiffy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
String menufinder(List<Menu> menu){  
  // Month Starting Week
  int startweek = Jiffy({"month": Jiffy().month.toInt()}).week;
  // Current WeekDay 
  // int now = (DateTime.now().weekday.toInt())-1;
  int now = 0;
  // Current Week 
  int curweek = Jiffy().week;
  // log(Jiffy().week.toString());
  // int sweek = curweek - startweek;
  int sweek = curweek - startweek;
  if(now<5){
    if(now==-1){
  String today = menu[sweek].firstWeek[0].food.toString();
  }
  String today = menu[sweek].firstWeek[now].food.toString();
  return(today);
  }else{
    return("Today's Holiday");
  }
}
class _MyHomePageState extends State<MyHomePage> {

  late List<Menu> _menu;
  late bool _loading;
  double _value = 0;
  int address = 0;
  late List<Sub> _sub;
  String todaysmenu = "Loading...";
  @override
  void initState(){
    super.initState();
    _loading = true;
    Services.getMenu().then((menu){
      _menu = menu;
    todaysmenu = menufinder(_menu);
    }
    );  
    Services.getSub().then((sub){
    log("message of sub");
    
      _sub = sub;
    _loading = false;
    setState(() {

    });
    }
    );
  }

    AddressOption? option;
    AddressOption? _option;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      leading: const Icon(Icons.arrow_back_ios_new),
      title: const Text(
        "Plan One",
        textAlign: TextAlign.center,
        ),
     ),
     body: Column(
      children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                  child: Card(
            child: Container(
              height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                        Text("Subscription Type:"),
                        Text(_loading ? "" : _sub[0].subsciptionType.toString())                        
                      ])
                      ],
                    ),
                    Row(
                      children: [

                    Radio(
                      value: AddressOption.deliveryAddress,
                      groupValue: option ,
                      onChanged: (AddressOption? value){
                        setState(() {
                          log("message");
                          option = value;
                          log(option.toString());
                        });
                      },
                      ),
                      Text("Delivery Adress:"),
                      ],
                    ),
                    Text(_loading ? "" : _sub[0].deliveryAddress.toString()),
                    // Text(_loading ? "" : ""),
                    Row(
                      children: [

                    Radio(
                      value: AddressOption.takeawayAddress,
                      groupValue: option,
                      onChanged: (AddressOption? value){
                        setState(() {
                          option = value;
                          log(option.toString());
                        });
                      },
                      ),
                      Text("TakeAway Adress:"),
                      ],
                    ),
                    Text(_loading ? "" : _sub[0].takeAwayAddress.toString()),
                    // Text(_loading ? "" : "s"),
                  ],
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 0, top: 5.0),
          ))
                ],
              ),
              Column(
                children: [
                 Card(
            child: Container(
              height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width*0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                        Text("Subscription ID:"),
                        Text(_loading ? "" : _sub[0].subscriptionId.toString())                        
                      ])
                      ],
                    ),
                    Text("Today's Menu"),
                    Text(todaysmenu),
                    (_loading ? Text("Loading") :_sub[0].image == null ? Text("No Image Available") : Image.network(_sub[0].image.toString()))
                    // Text(_loading ? "Loading" :_menu[0].firstWeek[3].food.toString())
                  ])
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 0, top: 5.0),
          )
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
              child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: 
                Column(
                  children: [
                    Text(_loading ? "Loading..." :"Days Left: " + (DateTime.fromMillisecondsSinceEpoch(_sub[0].endDate).difference(DateTime.fromMillisecondsSinceEpoch(_sub[0].startDate)).inDays).toString()),
                    Row(
                      children: [
                        Text(_loading ? "Loading" : DateTime.fromMillisecondsSinceEpoch(_sub[0].startDate).day.toString() + "/" +DateTime.fromMillisecondsSinceEpoch(_sub[0].startDate).month.toString()+ "/" +DateTime.fromMillisecondsSinceEpoch(_sub[0].startDate).year.toString()),
                  Slider(
                  min : 0,
                  max: (_loading ? 1 : (DateTime.fromMillisecondsSinceEpoch(_sub[0].endDate).compareTo(DateTime.fromMillisecondsSinceEpoch(_sub[0].startDate))).toDouble()),
                  divisions:(_loading ? 10 : (DateTime.fromMillisecondsSinceEpoch(_sub[0].endDate).difference(DateTime.fromMillisecondsSinceEpoch(_sub[0].startDate)).inDays)),
                  value: 0.5,
                  // value: (_loading ? 0.5 : (DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch)).difference(DateTime.fromMillisecondsSinceEpoch(_sub[0].startDate)).inDays).toDouble(),
                  label: _value.toString(),   
                  onChanged: (value){
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                 Text(_loading ? "Loading" : DateTime.fromMillisecondsSinceEpoch(_sub[0].endDate).day.toString() + "/" +DateTime.fromMillisecondsSinceEpoch(_sub[0].endDate).month.toString()+"/"+DateTime.fromMillisecondsSinceEpoch(_sub[0].endDate).year.toString()),
                      ],
                    )
                  ],
                )
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          )
              )
            ],
          )
      ],)
    );
  }

}
  enum AddressOption { takeawayAddress, deliveryAddress}
  
  void onChanged(Object? value, Object? groupValue){
      
  }