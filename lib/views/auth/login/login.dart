import 'package:chess_game/views/auth/common/form_footer.dart';
import 'package:chess_game/views/auth/common/form_header.dart';
import 'package:chess_game/views/auth/login/widgets/login_form.dart';
import 'package:chess_game/views/auth/login/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FormHeader(title: "Welcome Back"),
                  const LoginForm(),
                  const SocialLogin(),
                  SizedBox(height: 32.h,),
                  const FormFooter(goToLogin: false, title: "Don't have an account? ")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
