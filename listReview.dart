class Student {
  int grade;
  String firstName, lastName;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
}

void main() {
  List<Student> students = <Student>[
    Student("A", "B", 40),
    Student("C", "D", 95),
    Student("E", "F", 20),
    Student("G", "Z", 100)
  ];

  for (var i = 0; i < students.length; i++) {
    print(students[i].firstName + " " + students[i].lastName + " " + students[i].grade.toString());
  }

  print(" ----UPDATE---- ");
  students[2] = Student("Asd", "Efg", 40); // UPDATE : Index number is important

  for (var i = 0; i < students.length; i++) {
    print(students[i].firstName + " " + students[i].lastName + " " + students[i].grade.toString());
  }
  
  
  print(" ----DELETE---- ");
  students.removeAt(1);    // DELETE : Index number is important
  
  for (var i = 0; i < students.length; i++) {
    print(students[i].firstName + " " + students[i].lastName + " " + students[i].grade.toString());
  }
}
