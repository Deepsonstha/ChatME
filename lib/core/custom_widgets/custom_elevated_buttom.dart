// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool? isIcon;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? radius;
  final bool? isRadius;
  final double? fontSize;

  const CustomElevatedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.isIcon = false,
    this.icon,
    this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.radius,
    this.isRadius = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: isRadius == true
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(radius!),
                  right: Radius.circular(radius!),
                ),
              )
            : null,
        backgroundColor: backgroundColor ?? Colors.blue,
        foregroundColor: foregroundColor ?? Colors.white,
        minimumSize: Size(MediaQuery.of(context).size.width, 40.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon == true ? Icon(icon) : Container(),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Mukata",
              fontSize: fontSize ?? 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
