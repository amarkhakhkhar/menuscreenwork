class Menu{
  Menu({required this.name, required this.fweek,required this.sweek, required this.tweek, required this.frweek,required this.day, required this.food});
  final String name;
  final String fweek;
  final String sweek;
  final String tweek;
  final String frweek;
  final String day;
  final String food;

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
        name: json["source"],
        fweek: json["firstWeek"],
        sweek: json["secondWeek"],
        tweek: json["thirdWeek"],
        frweek: json["fourthWeek"],
        day : json["day"],
        food : json["food"]
    );
  }
}
