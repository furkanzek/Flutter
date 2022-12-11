class StudentValidator {
  String? stdFirstNameVal(String? value) {
    if (value!.length < 2) {
      return "İsim en az 2 karakterli olmalıdır.";
    }
  }

  String? stdLastNameVal(String? value) {
    if (value!.length < 2) {
      return "Soyisim en az 2 karakterli olmalıdır.";
    }
  }

  String? stdImageVal(String? value) {
    if (value!.length < 10) {
      return "Link en az 10 karakterli olmalıdır.";
    }
  }

  String? stdGradeVal(String? value) {
    var grade = int.parse(value!);
    if (grade < 0 || grade > 100) {
      return "Lütfen 0-100 aralığında bir not değeri girin.";
    }
  }
}
