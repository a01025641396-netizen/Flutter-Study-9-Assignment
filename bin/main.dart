import 'dart:convert';
import 'dart:io';
import 'package:dart_application_5/data_manager.dart';
import 'package:dart_application_5/score.dart';
import 'package:dart_application_5/student_score.dart';

void main() {
  //파일 호출
  loadStudentData("students.txt");
  //사용자가 입력한 값 리턴으로 가져옴
  StudentScore selected = checkStudentScore();
  //호출되서 result.txt"에 저장되면서 호출됨
  saveResults("result.txt", "${selected.name}, 점수: ${selected.score}");
}
