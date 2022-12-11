// ignore_for_file: deprecated_member_use

import 'package:deneme_app/models/student.dart';
import 'package:deneme_app/validation/std_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditStudent extends StatefulWidget {
  late Student selectedStudent;
  EditStudent(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  State<EditStudent> createState() => _EditStudentState(selectedStudent);
}

class _EditStudentState extends State<EditStudent> with StudentValidator {
  var formkey = GlobalKey<FormState>();

  late Student selectedStudent;

  _EditStudentState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Ahmet"),
      validator: stdFirstNameVal,
      onSaved: (String? value) {
        selectedStudent.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Yılmaz"),
      validator: stdLastNameVal,
      onSaved: (String? value) {
        selectedStudent.lastName = value!;
      },
    );
  }

  Widget buildImageLinkField() {
    return TextFormField(
      initialValue: selectedStudent.networkImageLink,
      decoration: InputDecoration(
          labelText: "Resim Linki",
          hintText:
              "https://cdn.pixabay.com/photo/2017/10/07/15/27/wolf-2826741__340.jpg"),
      validator: stdImageVal,
      onSaved: (String? value) {
        selectedStudent.networkImageLink = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Öğrenci Notu", hintText: "60"),
      validator: stdGradeVal,
      onSaved: (String? value) {
        selectedStudent.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
          Navigator.pop(context);
        }
      },
    );
  }
}
