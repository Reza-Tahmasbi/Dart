class Person{
    String _name;
    int _id;
    String _phoneNumber;
    String _address;
    Person(this._name, this._id, this._phoneNumber, this._address)
    Person.English(this._name, this._id, this._phoneNumber, this._address)
    String get getName => _name;
    int get id => _id;
    String get phoneNumber => _phoneNumber;
    String get address => _address;
}

enum Certificate {
    diploma,
    bachelor,
    master,
    Phd;
}

class Student extends Person{
    int studentID;
    String fieldOfStudy;
    Student(String name, String phoneNumber, String address, this.studentID, this.fieldOfStudy)
    : super(name, id, phoneNumber, address);
    Student.English(String name, String phoneNumber, String address, this.studentID):fieldOfStudy = "English literature";
    : super (name, id, phoneNumber, address);
}

class Teacher extends Person{
    Certificate highestDegree;
    int salary;
    Teacher(String name, String phoneNumber, String address, this.salary, this.Certificate)
    : super(name, id, phoneNumber, address);
}