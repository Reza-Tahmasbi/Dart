class Person{
    String _name;
    int _id;
    String _phoneNumber;
    String _address;

    Person(this._name, this._id, this._phoneNumber, this._address)

    String get getName => _name;
    String get id => _id;
    String get phoneNumber => _phoneNumber;
    String get address => _address;
}

class Student extends Person{
    int studentID;
    String major;
}