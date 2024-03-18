import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              prefixIcon: Icon(Icons.email)
          ),
        ),
        SizedBox(height: 16.h,),
        TextField(
          decoration: InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
              prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
        ),
        SizedBox(height: 16.h,),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Login"))),
        SizedBox(height: 32.h,),
      ],
    ));
  }
}
