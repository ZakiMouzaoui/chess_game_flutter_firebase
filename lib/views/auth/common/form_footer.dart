import 'package:chess_game/views/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../register/register.dart';


class FormFooter extends StatelessWidget {
  const FormFooter({super.key, required this.goToLogin, required this.title});

  final bool goToLogin;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        GestureDetector(
          onTap: (){
            if(goToLogin){
              Get.back();
            }
            else{
              Get.to(()=>const Register());
            }
          },
          child: Text(goToLogin ? "Login" : "Register", style: TextStyle(
              color: Colors.deepPurple.shade100,
              fontWeight: FontWeight.w600
          ),),
        ),
      ],
    );
  }
}
