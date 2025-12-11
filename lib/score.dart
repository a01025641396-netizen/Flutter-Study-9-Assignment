//클래스

class Score {
  //정수 점수
  int score;
  //생성자
  Score(this.score);
  //부모 메서드 아무것도 출력안함
  void showInfo() {}
}

//자식 클래스        부모클래스를 가져온다
class StudentScore extends Score {
  //이름은 스트림
  String name;
  // 자식클래스를  슈퍼로 점수를 같고와 :로 초기화 해준다
  StudentScore(this.name, int score) : super(score);
  //재정의
  @override
  //자식메서드
  void showInfo() {
    print("$name, 점수: $score");
  }
}
