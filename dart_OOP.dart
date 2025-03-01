// Abstract class for common properties
abstract class Person {
  String _name;
  int _id;
  String _phoneNumber;
  String _address;

  Person(this._name, this._id, this._phoneNumber, this._address);

  // Getter methods
  String get getName => _name;
  int get id => _id;
  String get phoneNumber => _phoneNumber;
  String get address => _address;

  void printPersonalInformation() {
    print("Name: $_name");
    print("ID: $_id");
    print("Phone Number: $_phoneNumber");
    print("Address: $_address");
  }

  void whatDoYouDo();
}

// Enum for teacher degrees
enum Certificate {
  diploma,
  bachelor,
  master,
  phd; // Changed Phd to lowercase
}

// Mixin for managing courses
mixin CourseManager {
  List<String> _courses = [];

  // Getter for courses
  List<String> get courses => _courses;

  // Setter for replacing course list
  set courses(List<String> newCourses) => _courses = newCourses;

  // Add new course
  void addCourse(String course) {
    if (!_courses.contains(course)) {
      _courses.add(course);
    }
  }

  // Remove course
  void removeCourse(String course) {
    if (_courses.contains(course)) {
      _courses.remove(course);
    } else {
      print("This course does not exist");
    }
  }
}

// Student class
class Student extends Person with CourseManager {
  int studentID;
  String fieldOfStudy;

  Student(int id, String name, String phoneNumber, String address, this.studentID, this.fieldOfStudy)
      : super(name, id, phoneNumber, address);

  Student.English(int id, String name, String phoneNumber, String address, this.studentID)
      : fieldOfStudy = "English literature",
        super(name, id, phoneNumber, address);

  @override
  void whatDoYouDo() {
    print("I study $fieldOfStudy");
  }
}

// Teacher class
class Teacher extends Person with CourseManager {
  Certificate highestDegree;
  int salary;

  Teacher(String name, int id, String phoneNumber, String address, this.salary, this.highestDegree)
      : super(name, id, phoneNumber, address);

  @override
  void whatDoYouDo() {
    print("I teach");
  }
}

// Main function to test functionality
void main() {
  // Creating a student
  Student student = Student(101, "Alice", "2001", "New York", 2021, "Computer Science");
  student.addCourse("Math");
  student.addCourse("Physics");
  print("Courses of ${student.getName}: ${student.courses}");

  // Creating a teacher
  Teacher teacher = Teacher("Mr. Smith", 202, "555-1234", "California", 5000, Certificate.master);
  teacher.addCourse("Algebra");
  teacher.addCourse("Calculus");
  print("Courses of ${teacher.getName}: ${teacher.courses}");

  // Removing a course from student's course list
  student.removeCourse("Math");
  print("Updated Courses of ${student.getName}: ${student.courses}");
}
