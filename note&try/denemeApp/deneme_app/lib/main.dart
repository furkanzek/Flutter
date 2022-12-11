// ignore_for_file: deprecated_member_use

import 'package:deneme_app/models/student.dart';
import 'package:deneme_app/screens/student_add.dart';
import 'package:deneme_app/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Student> students = [
    Student.withId(1, "Furkan", "Zekiri", 85,
        "https://cdn.pixabay.com/photo/2017/10/07/15/27/wolf-2826741__340.jpg"),
    Student.withId(2, "Emir", "Tonkal", 47,
        "https://cdn.pixabay.com/photo/2014/06/09/12/23/raccoon-365366__340.jpg"),
    Student.withId(3, "Sefa", "Geyik", 31,
        "https://cdn.pixabay.com/photo/2016/03/27/18/10/bear-1283347__480.jpg"),
    Student.withId(4, "Rümeysa", "Tuncer", 90,
        "https://cdn.pixabay.com/photo/2020/04/21/14/23/bird-5073270__340.jpghttps://cdn.pixabay.com/photo/2020/04/21/14/23/bird-5073270__340.jpg")
  ];

  Student selectedStudent = Student.withId(0, "", "", 0, "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Deneme App",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          elevation: 3,
          backgroundColor: Colors.amber,
        ),
        body: buildBody(context));
  }

  void uyari(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      content: Text(mesaj),
      elevation: 3,
    );

    showDialog(context: context, builder: (BuildContext contex) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(students[index].networkImageLink)),
                title: Text(
                    students[index].firstName + " " + students[index].lastName),
                subtitle: Text("Sınavdan aldığı not: " +
                    students[index].grade.toString() +
                    " (" +
                    students[index].getStatus +
                    ")"),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    selectedStudent = (students[index]);
                  });
                  print(selectedStudent);
                },
              );
            },
          ),
        ),
        Text("Seçili Öğrenci: " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastName),
        Row(children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
                color: Colors.amber,
                child: Center(
                  child: Row(
                    children: [
                      Text("Yeni"),
                      SizedBox(width: 5.0),
                      Icon(Icons.add)
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddStudent(students)));
                  /*var message = "Eklendi!";
                  uyari(context, message);*/
                }),
          ),
          SizedBox(width: 5.0),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
                color: Colors.amber,
                child: Center(
                  child: Row(
                    children: [
                      Text("Güncelle"),
                      SizedBox(width: 5.0),
                      Icon(Icons.update)
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditStudent(selectedStudent)));
                  /*var message = "Güncellendi!";
                  uyari(context, message);*/
                }),
          ),
          SizedBox(width: 5.0),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
                color: Colors.amber,
                child: Center(
                  child: Row(
                    children: [
                      Text("Sil"),
                      SizedBox(width: 5.0),
                      Icon(Icons.delete)
                    ],
                  ),
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var message = "Silindi!";
                  uyari(context, message);
                }),
          ),
        ]),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.more_time);
    } else {
      return Icon(Icons.clear);
    }
  }
}
