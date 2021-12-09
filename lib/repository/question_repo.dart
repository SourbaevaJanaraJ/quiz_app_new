
import 'package:get/get.dart';
import 'package:quiz_app_new/modules/controllers/home_controller.dart';

import '../models/question_model.dart';


class QuestionRepository{

final HomeController _homeController = HomeController.findHomeCont;
int index = 0;

  List <QuestionModel> questionBank = [
QuestionModel(question: '1. I want to learn spanish language', answer: true),
QuestionModel(question: '2. I love to read fantasy books', answer: true),
QuestionModel(question: '3. I eat beshbarmak everyday', answer: false),
QuestionModel(question: '4. One of my favorite crime novelist is Donato Karrisi', answer: false),
QuestionModel(question: '5. I had a chance to meet "The Rock"', answer: true),
QuestionModel(question: '6. The Guinnes World Plank Record belongs to me', answer: false),
QuestionModel(question: '7. I go for jogging every morning, except the weekends', answer: true),
];

 bool checkAsnwer(bool answer) {
   
    return answer == questionBank[index].answer;
  }
  
 bool isLastQuestion() {
    return questionBank[questionBank.length - 2].question ==
        questionBank[index].question;
  }

 bool isFinished() {
   
    return index >= questionBank.length - 1;
  }

   void nextQuestion() {
    if (index < questionBank.length - 1) {
      index++;
    }
  }
  
  
  String getQuestion() {
  
    return questionBank[index].question;
  }

   void reset() {
    index = 0;
    _homeController.resetAndStart();
  }

  
}


final QuestionRepository questionRepo = QuestionRepository();

