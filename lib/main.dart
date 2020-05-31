import 'package:flutter/material.dart';
import 'package:ogrencibilgisistemi/models/student.dart';
import 'package:ogrencibilgisistemi/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  //StatelessWidget eski hali, statefulwidget icin state kullanildi.
  List<Student> students = [
    Student.withId(1, "Sevdanur", "Genc", 40),
    Student.withId(2, "Selcuk", "Genc", 95)
    //Student.withId(3, "Liman", "Akcay", 80),
    //Student("Nano", "Genc", 45)
  ];
// statelesswidget tekrardan cizmez
// statefulwidger yeniden cizer.

  Student selectedStudent = Student.withId(0, "Ali", "cengiz", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold : ekranin ust kismini olusturur.
        appBar: AppBar(
            title: Text("Nano Ogrenci Takip Sistemi"),
            backgroundColor: Colors.red),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          //listeleri her turlu ekrana sigdirmak ve hassize hatasini gidermek icin kullanilir.
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      students[index].firstName +
                          " " +
                          students[index].lastName,
                      style: TextStyle(color: Colors.red)),
                  subtitle: Text(
                      "Sinavdan Aldigi Not : " +
                          students[index].grade.toString() +
                          " [" +
                          students[index].getStatus +
                          "]",
                      style: TextStyle(color: Colors.blue)),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/5441882?s=460&u=90752d8f9471ca8f463b5e2c9706df5ba0b20350&v=4"),
                  ),
                  trailing: bulidStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                    //print(selectedStudent.firstName);
                    //print(students[index].firstName + " secildi");
                  }, //tiklanildiginda, onlogpress uzun basildiginda
                  onLongPress: () {
                    print("Uzun basildi.");
                  },
                  //Icon(Icons.done),
                );
                //Text(students[index].firstName);
              }),
        ),
        Text(
          "Secili Ogrenci : " +
              selectedStudent.firstName +
              " " +
              selectedStudent.lastName,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        //Text("Secili Ogrenci : " + selectedStudent.firstName, style: TextStyle(color: Colors.purple, fontSize: 20), )
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Yeni Ogrenci",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                  //print("Yeni Ogrenci");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Guncelle",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  print("Guncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Sil",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  print("Sil");
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget bulidStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade > 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}

//import 'package:flutter/cupertino.dart';
//class MaterialApp extends Widget{
//  MaterialApp({Widget home}){
//    home materialapp'e ait bir constructor'dir.
//  }
//}
