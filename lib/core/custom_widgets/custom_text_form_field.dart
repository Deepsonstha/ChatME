// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String? topLabelText;
  final bool? isShowTopLabelText;
  final IconData? prefixIcon;
  final int? maxLine;
  bool isPrefix;
  bool isSuffix;
  bool readOnly;
  bool isobscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;

  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.topLabelText,
    this.isShowTopLabelText = false,
    this.prefixIcon,
    this.maxLine,
    this.isPrefix = false,
    this.isSuffix = false,
    this.readOnly = false,
    this.isobscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isShowTopLabelText == false ? const SizedBox.shrink() : Text(widget.topLabelText.toString()),
        SizedBox(height: 4.h),
        TextFormField(
          maxLines: widget.maxLine,
          controller: widget.controller,
          validator: widget.validator,
          initialValue: widget.initialValue,
          obscureText: widget.isobscureText,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          readOnly: widget.readOnly,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          // maxLines: widget.maxLine,
          style: TextStyle(fontSize: 14.sp, fontFamily: "Mukta"),
          decoration: InputDecoration(
            suffixIcon: widget.isSuffix
                ? widget.isobscureText == true
                    ? GestureDetector(
                        onTap: () {
                          setState(() {});
                          widget.isobscureText = false;
                        },
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {});
                          widget.isobscureText = true;
                        },
                        child: const Icon(
                          CupertinoIcons.eye_slash_fill,
                          color: Colors.grey,
                        ),
                      )
                : null,
            contentPadding: EdgeInsets.only(top: 18.h, left: 10.w),
            filled: true,
            fillColor: Colors.grey.shade300,
            prefixIcon: widget.isPrefix
                ? Icon(
                    widget.prefixIcon,
                    color: Colors.blue,
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(5.0.r),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(fontFamily: "Mukta", fontSize: 12.sp),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
            ),
          ),
        ),
      ],
    );
  }
}
