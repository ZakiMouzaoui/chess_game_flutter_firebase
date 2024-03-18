import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({super.key, this.gameTime, required this.label, this.icon, this.onTap});

  final String? gameTime;
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Brightness.dark == Theme.of(context).brightness ? ThemeData.dark().primaryColor.withOpacity(0.2) : Colors.white,
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Card(
          color: Colors.transparent,
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(icon != null) Icon(icon)
              else if(gameTime != null) Text(gameTime!),
              SizedBox(height: 16.h,),
              Text(label, style: const TextStyle(
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
