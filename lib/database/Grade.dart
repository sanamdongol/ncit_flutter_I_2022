class Grade {
  int? id; // adding ? in id because id can't be null if we create it
  String semester;
  String grade;

  Grade({this.id, required this.semester, required this.grade});

  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      'semester': semester,
      'grade': grade,
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'semester': semester,
      'grade': grade,
    };
    return map;
  }

  @override
  String toString() {
    return 'Grade{id: $id, semester: $semester, grade: $grade}';
  }
}
