class Mobile {
  int id;
  String model;
  String name;
  String photo;
 
  Mobile({this.id, this.name, this.photo});
 
  // Return object from JSON //
  factory Mobile.fromJson(Map<String, dynamic> json) {
    return Mobile(
        id: json['id'] as int,
        name: json['name'] as String,
        photo: json['photo'] as String);
      
  }
}