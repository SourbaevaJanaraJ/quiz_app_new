


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_new/repository/question_repo.dart';
import 'package:quiz_app_new/widgets/custom_dialog.dart';

class HomeController extends GetxController {
  static final HomeController findHomeCont = Get.find<HomeController>();
  RxList<Icon> icons = <Icon>[].obs;

    RxBool isLast = false.obs;

     RxString question = ''.obs;
  

  @override
  void onInit() {
    super.onInit();

  }

  // Tuura ikonka kosh
  void addCorrectIcon() {
    icons.add(Icon(
      Icons.check,
      color: Colors.green,
    ));
  }

  // Tuura emes ikonka kosh
  void addInCorrectIcon() {
    icons.add(Icon(
      Icons.close,
      color: Colors.red,
    ));
  }

    
  void resetAndStart() {
    icons.value = <Icon>[];
    isLast.value = false;
  }

  String getQuestion() {
   question.value =   questionRepo.getQuestion();
  }

  void checkAnswer(bool answer, BuildContext context) {
    final _isLastQuestion = questionRepo.isLastQuestion();


    if (_isLastQuestion) {
      isLast.value = true; 
    }

    final _isFinished = questionRepo.isFinished();

    if (_isFinished) {
      CustomDialog.showCustomDialog(
        parentContext: context,
        title: 'Finished!!!',
        content: Text('Start again!'),
      );
    
      isLast.value = true;
      questionRepo.reset();

    } else {
      
      final _result = questionRepo.checkAsnwer(answer);

    
      if (_result) {
        addCorrectIcon();
       
      } else {
        addInCorrectIcon();
        
      }
      questionRepo.nextQuestion();
      getQuestion();
     
    }
  }
}


