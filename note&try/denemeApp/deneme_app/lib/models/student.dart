class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;
  late String networkImageLink;

  Student(
      String firstName, String lastName, int grade, String networkImageLink) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.networkImageLink = networkImageLink;
    this._status = "";
  }

  Student.withId(int id, String firstName, String lastName, int grade,
      String networkImageLink) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.networkImageLink = networkImageLink;
    this._status = "";
  }

  Student.withoutInfo() {}

  void set setFirstName(String value) {
    this.firstName = value;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Büt";
    } else {
      message = "Kaldı";
    }

    return message;
  }
}
