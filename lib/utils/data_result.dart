

  class DataResult{

  static Map<String,dynamic> data={'date':'','wrong_answers':'','right_answers':'','difficulty_level':'','themes':''};
  static Map<String,dynamic> get getResult=>data;
  static updateDate({required String date}){
    data.update('date', (value) => date);
  }
  static updateWrongAnswers({required String wa}){
    data.update('wrong_answers', (value) => wa);
  }
  static updateRightAnswers({required String ra}){
    data.update('right_answers', (value) => ra);
  }
  static updateDifficultyLevel({required String diff}){
    data.update('difficulty_level', (value) => diff);
  }
  static updateThemes({required String tm}){
    data.update('themes', (value) => tm);
  }

  static String get getDate=>data['date'];
  static String get getWrongAnswer=>data['wrong_answers'];
  static String get getRightAnswer=>data['right_answers'];
  static String get getDifficulty=>data['difficulty_level'];
  static String get getThemes=>data['themes'];



  }