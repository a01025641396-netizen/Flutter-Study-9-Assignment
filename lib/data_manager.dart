import 'dart:io';
import 'package:dart_application_5/score.dart';

List<StudentScore> students = [];
// 함수에 메게 변수를 만들고
void loadStudentData(String path) {
  //예외처리구역
  try {
    //파일을 대입해준다
    final file = File(path);
    //파일을 하나씩 대입해준다
    final lines = file.readAsLinesSync();
    //리스트의 요소들을 빈상태로 만든다 있는이유: 파일을 1번실행하고 또 했을때 기준 파일이 있기 때문에 리스트를 여기서 초기화해준다
    students.clear();
    //lines를 line변수에 대입한다
    for (var line in lines) {
      final parts = line.split(',');
      //2와 같지 않다면 예외 처리
      if (parts.length != 2) throw Exception('잘못된 데이터 형식: $line');
      //학생의 이름 대입dart run
      String name = parts[0];
      //학생의 점수 대입
      int score = int.parse(parts[1]);
      // 자식 클래스를 리스트의 추가해준다
      students.add(StudentScore(name, score));
    } //예외처리
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    //프로그램 비정상종료
    exit(1);
  }
  return;
}

//메서드    파일경로 와 저장할txt파일
void saveResults(String path, String result) {
  //예외처리할 구역
  try {
    //파일경로를 대입한다
    final file = File(path);
    //저장하기
    file.writeAsStringSync(result, mode: FileMode.append);
    print("저장 완료!");
    //예외처리
  } catch (e) {
    print("저장 실패: $e");
    //프로그램 정상 종료
    exit(0);
  }
}
