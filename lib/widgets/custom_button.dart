import 'package:flutter/material.dart';
import 'package:quiz_app_new/constants/app_text_styles.dart';



class CustomButton extends StatelessWidget {
   CustomButton({Key key, 
  @required this.onPressed,
  @required this.buttonText,
   this.buttonBgColor,
   
  }) 
  : super(key: key);
 final VoidCallback onPressed;
 final String buttonText;
 final Color buttonBgColor;
 


   List<Widget> choice = [];

  
  
  @override
  Widget build(BuildContext context) {
    return  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: RaisedButton(
                            padding: EdgeInsets.all(12),
                            textColor: Colors.white,
                            color: buttonBgColor,
                            child: Text(buttonText,
                          style: AppTextStyles.mainQuestionStyle,
                            ),
                        onPressed: onPressed,
                          
                          ),
                        ),
                      );
  }
}
