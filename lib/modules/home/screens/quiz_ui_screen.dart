
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_new/constants/app_colors.dart';
import 'package:quiz_app_new/constants/app_text_styles.dart';
import 'package:quiz_app_new/modules/controllers/home_controller.dart';

import 'package:quiz_app_new/widgets/custom_button.dart';



class QuizUiScreen extends StatefulWidget {
  const QuizUiScreen({Key key}) : super(key: key);

  @override
  _QuizUiScreenState createState() => _QuizUiScreenState();
}

class _QuizUiScreenState extends State<QuizUiScreen> {
  final HomeController _homeController = HomeController.findHomeCont;

  @override
  void initState() {
    super.initState();
_homeController.getQuestion();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Obx(
                    () => Text(
                   _homeController.question.value, 
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mainQuestionStyle,
                  ),
                  ),
                ),
              ),
            ),
            Obx((){
           return _homeController.isLast.value
                ? const SizedBox.shrink()
                : CustomButton(
                    onPressed: () => _homeController.checkAnswer(true, context),
                    buttonText: 'Right',
                    buttonBgColor: Colors.green,
                  ); 
            }),
            // Obx(() {
            //     return _homeController.isLast.value
            //      ? const SizedBox.shrink()
            //     : CustomButton(
            //         onPressed: () => _homeController.checkAnswer(false, context),
            //         buttonText: 'Wrong',
            //         buttonBgColor: Colors.green,
            //       );
            // }), 
            Obx(()=> CustomButton(
              onPressed: () => _homeController.checkAnswer(false, context),
              buttonText: _homeController.isLast.value
               ? 'Start again' 
               : 'Wrong',
              buttonBgColor: Colors.red,
            ),
           ), 
            Obx(
              () => Row(
                children: _homeController.icons,
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}