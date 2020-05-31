import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrencibilgisistemi/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
//  StudentAdd(List<Student> students){
//    this.students = students;
//  }
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State <StudentAdd>{

  var formKey = GlobalKey<FormState>();

  Student student = Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Ogrenci"),
        ),
        body: Container(
          //form olusturuyoruz
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        )
      //Center(child: Text("Yeni Ogrenci"),),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ogrenci Adi", hintText: "Nano"),
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }
  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ogrenci Soyadi", hintText: "Genc"),
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldigi Not", hintText: "50"),
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }

}