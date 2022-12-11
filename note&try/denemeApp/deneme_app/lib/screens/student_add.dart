// ignore_for_file: deprecated_member_use

import 'package:deneme_app/models/student.dart';
import 'package:deneme_app/validation/std_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddStudent extends StatefulWidget {
  late List<Student> students;
  AddStudent(List<Student> students) {
    this.students = students;
  }

  @override
  State<AddStudent> createState() => _AddStudentState(students);
}

class _AddStudentState extends State<AddStudent> with StudentValidator {
  var formkey = GlobalKey<FormState>();
  var student = Student.withoutInfo();

  late List<Student> students;

  _AddStudentState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Öğrenci Ekleme Sayfası"),
      ),
      body: Container(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildImageLinkField(),
                  buildGradeField(),
                  buildSubmitButton(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Ahmet"),
      validator: stdFirstNameVal,
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Yılmaz"),
      validator: stdLastNameVal,
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildImageLinkField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Resim Linki",
          hintText:
              "https://cdn.pixabay.com/photo/2017/10/07/15/27/wolf-2826741__340.jpg"),
      validator: stdImageVal,
      onSaved: (String? value) {
        student.networkImageLink = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Notu", hintText: "60"),
      validator: stdGradeVal,
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
          students.add(student);
          Navigator.pop(context);
        }
      },
    );
  }
}
