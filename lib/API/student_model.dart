class Student {
  String studentId;
  String studentName;
  int studentScores;

  Student({required this.studentId,required this.studentName,required this.studentScores});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        studentId: parsedJson['id'],
        studentName: parsedJson['name'],
        studentScores: parsedJson['score']);
  }
}
