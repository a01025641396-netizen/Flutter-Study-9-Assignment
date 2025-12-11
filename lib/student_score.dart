import 'dart:convert';
import 'dart:io';
import 'package:dart_application_5/score.dart';
import 'data_manager.dart';

//
StudentScore checkStudentScore() {
  //변수의 값이 없는데 널변수가 될수없어서 ?로 널이 될수있는 변수로 바뀌줌
  String? inputName;
  //진짜 일떄 까지 반복
  while (true) {
    print("어떤 학생의 점수를 확인하시겠습니까?");
    //사용자가 엔터 누를때 까지 대기하다 inputName변수의 저장
    inputName = stdin.readLineSync(encoding: utf8);
    //입력을 받기전에 변수이기에 ?
    StudentScore? foundStudent;
    //반복 할때 1개씩 대입
    for (var student in students) {
      //네임이 같다면
      if (student.name == inputName) {
        //대입해준다
        foundStudent = student;
        //리스트를 끝까지 계속 반복하기에 브레이크로 멈춰준다
        break;
      }
    }
    //사용자가 입력한 값이 널이 아니라면
    if (foundStudent != null) {
      // 해당 변수의 정보를 출력한다
      foundStudent.showInfo();
      //리턴을 사용하여 selected로 변수를 호출되게 한다
      return foundStudent;
      //아니라면
    } else {
      print("잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.");
    }
  }
}
