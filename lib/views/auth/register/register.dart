import 'package:chess_game/views/auth/common/form_footer.dart';
import 'package:chess_game/views/auth/common/form_header.dart';
import 'package:chess_game/views/auth/login/widgets/social_login.dart';
import 'package:chess_game/views/auth/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  const FormHeader(title: "Join Chess Kingdom"),
                  const RegisterForm(),
                  const SocialLogin(),
                  SizedBox(height: 32.h,),
                  const FormFooter(goToLogin: true, title: "Already have an account? ")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
