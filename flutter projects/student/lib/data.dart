import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StudentData {
  final int id;
  final String firstName;
  final String lastName;
  final String course;
  final int score;
  final String createdAt;
  final String updatedAt;
  StudentData(this.id, this.firstName, this.lastName, this.course,
      this.createdAt, this.score, this.updatedAt);

  StudentData.fromJson(Map json)
      : id = json['id'],
        firstName = json["first_name"],
        lastName = json['last_name'],
        course = json["course"],
        score = json["score"],
        createdAt = json["created_at"],
        updatedAt = json["updated_at"];
}

class HttpClient {
  static Dio instance =
      Dio(BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1'));
}

Future<List<StudentData>> getStudents() async {
  List<StudentData> students = [];
  final response = await HttpClient.instance.get("experts/student");
  print(response.data);
  if (response.data is List<dynamic>){
    (response.data as List<dynamic>).forEach((element) {
      students.add(StudentData.fromJson(element));
    });
  }
  print(students.toString());
  return students;
}

Future<StudentData> saveStudent(String firstName, String lastName, String course, int score) async {
  final response = await HttpClient.instance.post("experts/student", data: {
    "first_name":firstName,
    "last_name": lastName,
    "course":course,
    "score":score,
  });
  if (response.statusCode == 220){
    return StudentData.fromJson(response.data);
  }else{
    throw Exception();
  }
}
