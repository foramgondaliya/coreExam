import 'package:flutter/material.dart';
import 'dart:io';

class Student {
  // List<String> skillData;
  // List<String> hobbyData;
  String StudentName;

  File? profileImageFile;

  String grid;
  String name;
  String age;

  Student({
    required this.grid,
    required this.age,
    required this.name,
    required this.profileImageFile,
    required this.StudentName,
    // required this.hobbyData,
    // required this.skillData,
  });
}
