// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserCard extends StatelessWidget {
  final String userName;
  final String userAbout;
  final String image;
  final String lastOnline;
  final bool isOnline;
  const CustomUserCard({
    Key? key,
    required this.userName,
    required this.userAbout,
    required this.image,
    required this.lastOnline,
    required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
          title: Text(userName),
          subtitle: Text(userAbout),
          trailing: Text(lastOnline),
        ),
        isOnline
            ? Positioned(
                top: 50.h,
                left: 40.w,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 6.r,
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
