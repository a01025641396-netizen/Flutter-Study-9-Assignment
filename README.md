# 학생 점수 관리 프로그램

## 1️.과제 목적
- 학생 이름과 점수를 관리하고, 사용자가 선택한 학생의 점수를 확인 후 결과를 저장


## 2️.기존 구조 문제점


### 3-1. 데이터 모델
```dart
// score.dart
class Score {
  int score;
  Score(this.score);
  void showInfo() {}
}

// student_score.dart
class StudentScore extends Score {
  String name;
  StudentScore(this.name, int score) : super(score);

  @override
  void showInfo() {
    print("$name, 점수: $score");
  }
}
3-2. Repository 인터페이스
abstract class StudentRepository {
  List<StudentScore> getAllStudents();
  StudentScore? getStudentByName(String name);
  void saveResult(String result);
}
3-3. 파일 기반 Repository 구현
class FileStudentRepository implements StudentRepository {
  final String filePath;
  List<StudentScore> _students = [];

  FileStudentRepository(this.filePath) {
    _loadStudents();
  }

  void _loadStudents() {
    // 파일 읽기 및 StudentScore 리스트 생성
  }

  @override
  List<StudentScore> getAllStudents() => _students;

  @override
  StudentScore? getStudentByName(String name) {
    return _students.firstWhere((s) => s.name == name, orElse: () => null);
  }

  @override
  void saveResult(String result) {
    // result.txt에 저장
  }
}
3-4. 사용자 입력 처리
 StudentScore? checkStudentScore(StudentRepository repo) {
  while (true) {
    print("어떤 학생의 점수를 확인하시겠습니까?");
    String? inputName = stdin.readLineSync();
    if (inputName == null || inputName.isEmpty) continue;

    StudentScore? student = repo.getStudentByName(inputName.trim());
    if (student != null) {
      student.showInfo();
      return student;
    } else {
      print("잘못된 학생 이름입니다. 다시 입력해주세요.");
    }
  }
}
3-5. main.dart
 void main() {
  final repo = FileStudentRepository("students.txt");

  StudentScore? selected = checkStudentScore(repo);
  if (selected != null) {
    repo.saveResult("${selected.name}, 점수: ${selected.score}");
  }
}
 
 
 ## 실행방식

1.students.txt에 학생 데이터 작성 (예: 홍길동,90)

2.main.dart 실행

3.학생 이름 입력 → 점수 확인 → 결과 저장 (result.txt)





















