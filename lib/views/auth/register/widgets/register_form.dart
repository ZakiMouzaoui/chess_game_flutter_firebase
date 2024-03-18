import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
              prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.remove_red_eye)
          ),
          onSubmitted: (val){
            print(val);
          },
          obscureText: true,
        ),
        SizedBox(height: 16.h,),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Register"))),
        SizedBox(height: 32.h,),
      ],
    ));
  }
}
