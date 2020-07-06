import 'dart:convert';

class Person {
   String name;
   String age;

  Person({this.age, this.name});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String,dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }

}
