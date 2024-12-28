main() {
  var student1 = Student(
    'John Doe',
    20,
    '23 Main Street',
    1,
    '4.00',
    [90, 85, 82],
  );

  print("Student information:\n");
  student1.displayRole();
  print("Name: ${student1.name}");
  print("Age: ${student1.age}");
  print("Address: ${student1.address}");
  print("Average Score: ${student1.calculateScore().toStringAsFixed(2)}");


  // var teacher1 = Teacher(
  //   'Mrs. Smith',
  //   35,
  //   '456 Oak',
  //   1,
  //   ['Math', 'English', 'Bangla'],
  // );
  // print("Teacher information:\n");
  // teacher1.displayRole();
  // print("Name: ${teacher1.name}");
  // print("Age: ${teacher1.age}");
  // print("Address: ${teacher1.address}");
  // teacher1.printCoursesTaught();
}

abstract class Role {
  void displayRole() {}
}

class Person extends Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address) {}
}

class Student extends Person {
  int studentId;
  String grade;
  List<double> courseScored;

  Student(
    super.name,
    super.age,
    super.address,
    this.studentId,
    this.grade,
    this.courseScored,
  );

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateScore() {
    double sum = courseScored.reduce((a, b) => a + b);
    return sum / courseScored.length;
  }
}

class Teacher extends Person {
  int teacherId;
  List<String> coursesTaught;

  Teacher(
    super.name,
    super.age,
    super.address,
    this.teacherId,
    this.coursesTaught,
  );

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void printCoursesTaught() {
    String result = "Courses Taught:";
    for (String course in coursesTaught) {
      result += "\n- $course";
    }
    print(result);
  }
}
