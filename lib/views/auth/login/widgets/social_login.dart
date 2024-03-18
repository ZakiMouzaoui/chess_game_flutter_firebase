import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: Colors.white12,
                indent: 30.w,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Text("Or"),
            ),
            Expanded(
              child: Divider(
                color: Colors.white12,
                endIndent: 30.w,
                thickness: 1,
              ),
            )
          ],
        ),
        SizedBox(height: 32.h,),
        OutlinedButton(onPressed: (){}, child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/google-icon.png", width: 20.w,),
            SizedBox(width: 16.w,),
            const Text("Sign in with Google")
          ],
        )),
        SizedBox(height: 16.h,),
        OutlinedButton(onPressed: (){}, child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/twitter-icon.webp", width: 20.w,),
            SizedBox(width: 16.w,),
            const Text("Sign in with Twitter")
          ],
        )),
      ],
    );
  }
}
