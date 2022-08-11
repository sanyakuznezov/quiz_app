



  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app_bloc/app_bloc.dart';
import 'package:quiz_app/data/models/model_quiz.dart';
import 'package:quiz_app/presentation/result_screen.dart';
import 'package:quiz_app/resources/app_colors.dart';
import 'package:quiz_app/resources/app_images.dart';
import 'package:quiz_app/utils/data_result.dart';
import '../resources/app_constants.dart';

  final PageController _pageController=PageController();
  final List<String> _listAnswerResult=[];
  int i=0;

class QuizScreen extends StatelessWidget{
  const QuizScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc,AppState>(
      builder: (context,state) {
       return Scaffold(
         body: Container(
           alignment: Alignment.center,
           decoration: BoxDecoration(
             image:DecorationImage(
               image: AssetImage(bgQuiz),
               fit: BoxFit.fill
             )
           ),
           width: double.infinity,
           height: double.infinity,
           child: PageView(
             physics:const NeverScrollableScrollPhysics(),
             controller: _pageController,
             children: List.generate(state.listQuiz.length, (index) {
               return Center(child: _ItemQuiz(modelQuiz: state.listQuiz[index],
               call: (value){
                 i++;
                 _listAnswerResult.add(value!);
                 if(i==state.listQuiz.length){
                   _setResult();
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const ResultScreen()));
                 }else{
                   _pageController.animateToPage(i, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                 }

               },));
        })
           ),
         ));
      }
    );
  }


  _setResult(){
    final date=DateTime.now().toString();
    int ra=0;
    int wa=0;
   for (var element in _listAnswerResult) {
      if(element=="true"){
        ra++;
      }else{
        wa++;
      }
   }
    DataResult.updateRightAnswers(ra: ra.toString());
    DataResult.updateWrongAnswers(wa: wa.toString());
   DataResult.updateDate(date: date);

  }




}






   class _ItemQuiz extends StatefulWidget{
       _ItemQuiz({Key? key,required this.modelQuiz,required this.call}) : super(key: key);

     final ModelQuiz modelQuiz;
     var call=(String? value)=>value;

  @override
  State<_ItemQuiz> createState() => _ItemQuizState();
}

class _ItemQuizState extends State<_ItemQuiz> {


  List<String> _listAnswer=[];
  List<String> _listCorrect=[];


  @override
  void initState() {
    super.initState();
    _listAnswer=_getListAnswer(widget.modelQuiz);
    _listCorrect=_getListCorrect(widget.modelQuiz);

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                  top: 50, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: color128_60,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color125)),
              child: Text(widget.modelQuiz.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: color125,
                    fontSize: 20,
                    fontFamily: Constants.silkScreen
                ),)),
          Column(
              children: List.generate(_listAnswer.length, (index) {
                  return _ItemAnswer(answer: _listAnswer[index], correct: _listCorrect[index],
                    onTap: (value){
                    widget.call(value);
                    },);
              }),
            ),
        ],
      ),
    );
  }

  List<String> _getListCorrect(ModelQuiz modelQuiz){
    final List<String> a=[];
    a.add(modelQuiz.answerACorrect);
    a.add(modelQuiz.answerBCorrect);
    a.add(modelQuiz.answerCCorrect);
    a.add(modelQuiz.answerDCorrect);
    a.add(modelQuiz.answerECorrect);
    a.add(modelQuiz.answerFCorrect);

    return a;
  }



  List<String> _getListAnswer(ModelQuiz modelQuiz){
    final List<String> r=[];
    if(modelQuiz.answerA.isNotEmpty)r.add(modelQuiz.answerA);
    if(modelQuiz.answerB.isNotEmpty)r.add(modelQuiz.answerB);
    if(modelQuiz.answerC.isNotEmpty)r.add(modelQuiz.answerC);
    if(modelQuiz.answerD.isNotEmpty)r.add(modelQuiz.answerD);
    if(modelQuiz.answerE.isNotEmpty)r.add(modelQuiz.answerE);
    if(modelQuiz.answerF.isNotEmpty)r.add(modelQuiz.answerF);
    return r;

  }


}

  class _ItemAnswer extends StatefulWidget{

     _ItemAnswer({Key? key,required this.answer,required this.correct,required this.onTap}) : super(key: key);


    final String answer;
    final String correct;
    var onTap=(String? value)=>value;


  @override
  State<_ItemAnswer> createState() => _ItemAnswerState();
}

class _ItemAnswerState extends State<_ItemAnswer> {

  bool _isChek=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        setState(() {
            _isChek=true;
        });
        widget.onTap(widget.correct);
      },
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: _getColorAnswer(_isChek, widget.correct),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color125)
          ),
          child:
          Text(widget.answer,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: color125,
                fontSize: 15,
                fontFamily: Constants.silkScreen
            ),)),
    );
  }
  Color _getColorAnswer(bool isChek,String correct){
    Color j=color128_60;
    if(isChek){
       if(correct=='true'){
         j= colorGreen50;
       }else{
         j=colorRed50;
       }
    }
    return j;
  }
}