import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FormHeader extends StatelessWidget {
  const FormHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/chess-logo.png", height: 120.h,),
        SizedBox(height: 32.h,),
        Text(title, style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
        )),
        SizedBox(height: 32.h,),
      ],
    );
  }
}
