


  class ModelQuiz{

  final String question;
  final String  answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final String answerE;
  final String answerF;
  final String answerACorrect;
  final String answerBCorrect;
  final String answerCCorrect;
  final String answerDCorrect;
  final String answerECorrect;
  final String answerFCorrect;

   const ModelQuiz({required this.question,required this.answerA,required this.answerB,required this.answerC,required this.answerD,required this.answerE,required this.answerF,
   required this.answerACorrect,required this.answerBCorrect,required this.answerCCorrect,required this.answerDCorrect,required this.answerECorrect,required this.answerFCorrect});


   factory ModelQuiz.fromJSON({required Map<String,dynamic > map}){
     return ModelQuiz(
         question: map['question']??'',
         answerA: map['answers']['answer_a']??'',
         answerB: map['answers']['answer_b']??'',
         answerC: map['answers']['answer_c']??'',
         answerD: map['answers']['answer_d']??'',
         answerE: map['answers']['answer_e']??'',
         answerF: map['answers']['answer_f']??'',
         answerACorrect: map['correct_answers']['answer_a_correct'],
         answerBCorrect: map['correct_answers']['answer_b_correct'],
         answerCCorrect: map['correct_answers']['answer_c_correct'],
         answerDCorrect: map['correct_answers']['answer_d_correct'],
         answerECorrect: map['correct_answers']['answer_e_correct'],
         answerFCorrect: map['correct_answers']['answer_f_correct'] );
   }
  }